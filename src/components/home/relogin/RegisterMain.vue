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
        <div id="register" class="my-card">
          <el-form class="my-form" :rules="rules" :model="ruleForm" ref="ruleForm" onsubmit="return false;">
            <el-form-item>
              <el-input class="my-input" type="text" v-model="ruleForm.phone" disabled>
                <template slot="prepend">手机号</template>{{ruleForm.phone}}</el-input>
            </el-form-item>
            <el-form-item prop="username"
                          :rules="[
          { required: true, message: '请输入用户名称', trigger: 'blur' },
          { min: 3, message: '长度必须大于 3 个字符', trigger: 'blur' }
  ]">
              <el-input class="my-input" type="text"
                        v-model="ruleForm.username"><template slot="prepend">用户名</template></el-input>
            </el-form-item>
            <el-form-item prop="password">
              <el-input class="my-input" type="password"
                        v-model="ruleForm.password" show-password><template slot="prepend">输入密码</template></el-input>
            </el-form-item>
            <el-form-item prop="re_password">
              <el-input class="my-input" type="password"
                        v-model="ruleForm.re_password" show-password><template slot="prepend">确认密码</template></el-input>
            </el-form-item>
            <el-form-item prop="email"
                          :rules="[
          { required: true, message: '请输入邮箱地址', trigger: 'blur' },
          { type: 'email', message: '邮箱地址格式错误', trigger: ['blur', 'change'] }
  ]">
              <el-input class="my-input" type="text"
                        v-model="ruleForm.email" clearable><template slot="prepend">邮箱</template></el-input>
            </el-form-item>
            <div class="additional">
              <el-row>
                点击注册即同意以下协议
                <el-link type="danger" :underline="false">《用户协议》</el-link>、
                <el-link type="danger" :underline="false">《隐私协议》</el-link>
              </el-row>
            </div>
            <el-form-item>
              <button class="my-btn" @click="submitForm('ruleForm')">注 册</button>
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
    const validatePsw = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入密码'))
      } else {
        if (this.ruleForm.re_password !== '') {
          this.$refs.ruleForm.validateField('re_password')
        }
        callback()
      }
    }
    const validateRepsw = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'))
      } else if (this.ruleForm.password !== value) {
        callback(new Error('两次输入密码不一致'))
      } else {
        callback()
      }
    }
    return {
      active: 1,
      ruleForm: {
        phone: '',
        username: '',
        password: '',
        re_password: '',
        email: ''
      },
      rules: {
        password: [
          { min: 5, max: 20, required: true, message: '格式错误，密码长度需大于5，小于20' },
          { validator: validatePsw, trigger: 'blur' }
        ],
        re_password: [{ validator: validateRepsw, trigger: 'blur' }]
      }
    }
  },
  created () {
    // 得到手机号
    let param = ''
    param = this.$emit('sendPhone', param)
    param = param.$attrs.phone
    this.ruleForm.phone = param
  },
  methods: {
    submitForm (formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.$axios.post('/user/signup', {
            telphone: this.ruleForm.phone,
            username: this.ruleForm.username,
            password: this.ruleForm.password,
            email: this.ruleForm.email
          }).then((response) => {
            if (response.status === 200) {
              this.$router.replace('/signup/person/signup_success')
            } else if (response.status === 400) {
              this.$alert(response.msg)
            }
          }).catch((err) => console.log(err))
        } else {
          this.$message.error('请完整填写注册信息，才能完成注册')
          return false
        }
      })
    }
  }
}
</script>
<style scoped>
@import "../../../assets/css/signup.css";
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
}
/deep/ .el-divider__text, .el-link {
  font-weight: 500;
  font-size: 12px;
  position: relative;
  top: -2px;
}
</style>
