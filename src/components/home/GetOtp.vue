<template>
  <div class="my-card" id="getopt">
    <el-form class="my-form" :model="data" :rules="rules" ref="data">
      <el-form-item prop="phone">
        <el-input class="my-input" type="text"
                  v-model="data.phone"
                  placeholder="请输入常用的手机号"
                  autocomplete="off"><template slot="prepend">手机号</template></el-input>
      </el-form-item>
    </el-form>
    <el-form :model="verification" :rules="rules" ref="verification">
      <el-form-item prop="verification">
        <div v-if="data.isShow">
          <el-input class="my-input" type="text"
                    v-model="data.verification"
                    placeholder="请输入验证码"
                    autocomplete="off"></el-input>
        </div>
        <div v-else>
          <button class="default-btn" @click="validatePhone">点击按钮进行验证</button>
          <div class="el-form-item_error" v-show="!isClick"><i class="el-icon-warning"></i> 请先进行手机号验证</div>
        </div>
      </el-form-item>
      <el-form-item>
        <button class="my-btn" @click="toSignin">下一步</button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  data () {
    const phoneValidate = (rule, value, callback) => {
      const reg = /^1[3456789]\d{9}$/
      if (reg.test(value)) {
        callback()
      } else if (!value) {
        callback(new Error('请输入手机号'))
      } else {
        callback(new Error('手机号格式错误'))
      }
    }
    const verifiValidate = (rule, value, callback) => {
      const reg = '123'
      if (reg === value) {
        callback()
      } else if (!value) {
        callback(new Error('请输入验证码'))
      } else {
        callback(new Error('验证码错误'))
      }
    }
    return {
      data: {
        phone: ''
      },
      verification: {
        verification: ''
      },
      isClick: true,
      isShow: false,
      isValidate: false,
      rules: {
        phone: [
          { validator: phoneValidate, trigger: 'change' }
        ],
        verification: [
          { required: true, validator: verifiValidate, trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    validatePhone () {
      this.data.isClick = true
      this.$refs.data.validate((isValid, errors) => {
        if (isValid) {
          this.isValidate = true
          this.isShow = true
          this.$emit('savePhone', this.data.phone)
        } else {
          this.$message.error('请输入正确的手机号进行验证')
        }
      })
      // this.isValidate = true
    },
    toSignin () {
      if (this.isValidate) {
        this.$router.push('/signin/person2')
        this.$emit('nextView', 1)
      } else {
        this.data.isClick = false
        this.$message.error('请先进行手机号验证')
      }
    }
  }
}
</script>

<style scoped>
@import "../../assets/css/signin.css";

/deep/ .el-input__inner{
  height: 56px;
  line-height: 56px;
  font-size: 16px;
}
/deep/ .el-input__inner:focus{
  border: 1px solid #666;
}
/deep/ .el-step__icon {
  width: 22px;
  height: 22px;
  font-size: 12px;
}
/deep/ .el-step__head.is-process {
  color: #333;
  border-color: #333;
}
/deep/ .el-step__title.is-process {
  font-weight: 510;
}
/deep/ .el-step__title {
  font-size: 12px;
  line-height: 36px;
}
/deep/ .el-step__icon-inner.is-status {
  transform: translateY(0);
}
/deep/ .el-form-item {
  margin-bottom: 30px;
}
</style>
