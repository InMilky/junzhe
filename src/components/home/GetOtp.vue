<template>
  <div class="my-main">
    <el-row type="flex" justify="center">
      <el-col :span="10">
        <!--  进度条  -->
        <el-steps :active="active" finish-status="success" align-center>
          <el-step title="验证手机号"></el-step>
          <el-step title="填写账号信息"></el-step>
          <el-step title="注册成功"></el-step>
        </el-steps>
        <div class="my-card" id="getopt">
          <el-form class="my-form" :model="data" :rules="rules" ref="data">
            <el-form-item prop="phone">
              <el-input class="my-input" type="text"
                        v-model="data.phone"
                        placeholder="请输入常用的手机号"
                        autocomplete="off"><template slot="prepend">手机号</template></el-input>
            </el-form-item>
            <el-form-item>
                <button class="default-btn" @click="validatePhone">点击按钮进行验证</button>
                <div class="el-form-item_error" v-show="!data.isClick"><i class="el-icon-warning"></i> 请先进行手机号验证</div>
            </el-form-item>
            <el-form-item>
              <button class="my-btn" @click="toSignin">下一步</button>
            </el-form-item>
          </el-form>
        </div>
      </el-col>
    </el-row>
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
    return {
      active: 0,
      data: {
        phone: '',
        isClick: true
      },
      isValidate: false,
      rules: {
        phone: [
          { validator: phoneValidate, trigger: 'change' }
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
/deep/ .el-input__inner{
  height: 56px;
  line-height: 56px;
  font-size: 16px;
}
/deep/ .el-input__inner:focus{
  border: 1px solid #666;
}
/deep/ .el-form-item {
  margin-bottom: 30px;
}
/deep/ .el-input-group__prepend{
  width: 100px;
  padding: 0;
  text-align: center;
  letter-spacing: 3px;
}
.el-form-item_error {
  color: #f91;
  font-size: 12px;
  /* color: #F56C6C; */
  position: relative;
  top: -6px;
  height: 33px;
  line-height: 33px;
}
</style>
