<template>
  <div id="register" class="my-card">
    <el-form class="my-form" :rules="rules" :model="ruleForm" ref="ruleForm">
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
      <el-form-item prop="repassword">
        <el-input class="my-input" type="password"
                  v-model="ruleForm.repassword" show-password><template slot="prepend">确认密码</template></el-input>
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
</template>

<script>
export default {
  data () {
    const validatePsw = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入密码'))
      } else {
        if (this.ruleForm.repassword !== '') {
          this.$refs.ruleForm.validateField('repassword')
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
      ruleForm: {
        phone: '',
        username: '',
        password: '',
        repassword: '',
        email: ''
      },
      rules: {
        password: [
          { min: 5, max: 20, required: true, message: '格式错误，密码长度需大于5，小于20' },
          { validator: validatePsw, trigger: 'blur' }
        ],
        repassword: [{ validator: validateRepsw, trigger: 'blur' }]
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
          this.$router.push('/signin/person/signin_success')
          this.$emit('nextView', 3)
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

@import "../../assets/css/signin.css";
/deep/ .el-input__inner{
  height: 56px;
  line-height: 56px;
  font-size: 16px;
}
/deep/ .el-input__inner:focus{
  border: 1px solid #666;
}
/deep/  .el-input::-webkit-scrollbar-thumb {
  border-radius: 0;
}
/deep/ .el-form-item {
  margin-bottom: 30px;
}
/deep/  .el-link.el-link--danger {
  font-size: 12px;
}
/deep/ .el-input-group__prepend{
  width: 88px;
  text-align: center;
  padding: 0;
}

</style>
