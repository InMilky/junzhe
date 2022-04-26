<template>
  <div class="checkout-view">
    <el-row class="headerarea" type="flex" justify="center">
      <el-col :span="20">
        <el-row type="flex" justify="space-between">
          <el-col :span="6">
            <div class="logo">
              <img src="@/assets/logo.png" />
              <div class="page-title">结算页面</div>
            </div>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
    <el-row type="flex" justify="center">
      <el-col :span="20">
        <h3>填写并核对订单信息</h3>
        <div class="order-main">
          <div class="receiver-info">
            <div class="rec-title">
              <span>确认收货地址</span>
              <el-link :underline="false" style="float: right;font-size: 12px" @click="dialogFormVisible = true">管理收货地址</el-link></div>
            <div class="rec-info" v-if="JSON.stringify(receiver) !== '{}'">
              <span class="checked" style="margin-right: 8px;position:relative;">
                {{ receiver.name }}
                <label class="el-upload-list__item-status-label"><i class="el-icon-upload-success el-icon-check"></i></label>
              </span>
              <span>{{ receiver.name }} {{receiver.telphone}} {{receiver.address}}</span>
              <el-tag type="danger" size="mini">默认地址</el-tag>
            </div>
            <div class="rec-info" v-else>
              <span style="color: #e1251b">暂无收货地址</span>
            </div>
            <span class="rec-link">更多地址<i class="el-icon-arrow-down"></i></span>
          </div>
          <div class="pay-method">
            <div class="pay-title">支付方式</div>
            <div class="pay-ways">
              <span :class="onlineClass" @click="activeChange(0)">在线付款</span>
              <span :class="deliverClass" @click="activeChange(1)">货到付款</span>
              <span class="el-dropdown-link">更多<i class="el-icon-d-arrow-right"></i></span>
            </div>
          </div>
          <div class="order-info">
            <div class="order-title">确定订单信息</div>
            <div class="order-item" v-for="list in orderList" :key="list.ID">
              <div class="item-img">
                <img :src="list.img_url"/></div>
              <div class="item-title">
                <div>{{ list.title }}</div>
                <div style="color: #999999;font-size: 12px;padding-top: 3px">{{list.color}}</div>
              </div>
              <div class="item-price" style="font-weight: 700;">￥{{ list.price| dot }}</div>
              <div class="item-num">x{{list.quantity}}</div>
              <div class="item-amount" style="color: #e1251b;font-weight: 700;">￥{{ (list.price * list.quantity)| dot }}</div>
            </div>
          </div>
        </div>
        <div class="detail">
          <div>总商品金额：<span style="color: #e1251b;font-size: 16px;">￥{{totalPrice| dot }}</span></div>
          <div>运费：免费配送 快递 免邮费</div>
          <div>
            <div>应付总金额：<span style="color: #e1251b;font-size: 24px;font-weight: bold;line-height: 54px">￥{{totalPrice|dot }}</span></div>
            <div style="color: #606266;font-size: 12px;line-height: 16px;margin-top: 8px" v-if="JSON.stringify(receiver) !== '{}'">寄送至：{{receiver.address}}</div>
            <div style="color: #606266;font-size: 12px;line-height: 16px" v-if="JSON.stringify(receiver) === '{}'">收货人：{{receiver.name || '-'}} {{receiver.telphone || '-'}}</div>
          </div>
        </div>
        <div style="overflow: hidden">
          <el-link class="topay" @click.native="checkout" :underline="false" :disabled="JSON.stringify(receiver) !== '{}'">>提交订单</el-link>
        </div>
        <div style="overflow: hidden">
          <b v-if="JSON.stringify(receiver) === '{}'" style="font-size: 14px;color: #e1251b;float: right;position: relative;right: 36px;">
          <i class="el-icon-error"></i> 请填写收货地址</b></div>
      </el-col>
    </el-row>
    <el-dialog title="添加收货地址" :visible.sync="dialogFormVisible">
      <el-form :rules="rules" :model="form" ref="form" onsubmit="return false;">
        <el-form-item label="收货人" :label-width="'80px'" prop="name">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="手机号" :label-width="'80px'" prop="phone">
          <el-input v-model="form.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="详细地址" :label-width="'80px'" prop="address">
          <el-input v-model="form.address" clearable></el-input>
        </el-form-item>
        <el-form-item label="设为默认收货地址">
          <el-switch v-model="form.isDefault"></el-switch>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button class="cancelbtn" @click="dialogFormVisible = false">取 消</el-button>
        <el-button class="confirmbtn" type="warming" @click="addReceiver('form')">添 加</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import { SERVER_HOST } from '@/plugins/config'

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
      ID: '',
      buyNum: '',
      account: '',
      orderList: [],
      dialogFormVisible: false,
      form: {
        name: '',
        phone: '',
        address: '',
        isDefault: true
      },
      rules: {
        name: [
          { required: true, message: '请输入收货人名称', trigger: 'blur' }
        ],
        address: [
          { required: true, message: '收货地址不能为空', trigger: 'blur' }
        ],
        phone: [
          { required: true, message: '手机号不能为空', trigger: 'blur' },
          { validator: phoneValidate, trigger: 'change' }
        ]
      },
      receiver: {},
      onlineClass: 'checked',
      deliverClass: 'non-checked'
    }
  },
  async mounted () {
    this.ID = this.$route.query.ID
    this.buyNum = this.$route.query.buyNum
    await this.getOrderItem()
    await this.getReceiver()
  },
  methods: {
    getOrderItem () {
      this.$axios.get('/order/confirmOrder', { params: { ID: this.ID } }).then(res => {
        if (res.status === 200) {
          res.data = res.data.map((item) => {
            item.img_url = SERVER_HOST + item.img_url
            item.quantity = this.buyNum
            return item
          })
          this.orderList = res.data
        } else {
          this.$message.error(res.msg)
        }
      }).catch(err => {
        this.$message.error(err)
      })
    },
    checkout () {
      this.$axios.post('/order/checkout', { ID: this.ID, account: this.account, quantity: this.buyNum })
        .then(res => {
          if (res.status === 200) {
            const orderID = res.data
            this.$router.push({ name: 'cashier', query: { orderID: orderID, account: this.account } })
          }
        }).catch(err => {
          Promise.reject(err)
        })
    },
    activeChange (val) {
      if (val === 0) {
        this.onlineClass = 'checked'
        this.deliverClass = 'non-checked'
      } else {
        this.deliverClass = 'checked'
        this.onlineClass = 'non-checked'
      }
    },
    getReceiver () {
      this.$axios.get('/user/getReceiver')
        .then(res => {
          if (res.status === 200) {
            this.receiver = res.data[0]
          } else {
            this.receiver = {}
          }
        }).catch(err => {
          Promise.reject(err)
        })
    },
    addReceiver (formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.dialogFormVisible = false
          this.$axios.post('/user/addReceiver', {
            telphone: this.form.phone,
            name: this.form.name,
            address: this.form.address,
            is_default: this.form.isDefault
          }).then((response) => {
            if (response.status === 200) {
              this.receiver = response.data[0]
              this.dialogFormVisible = false
            }
          })
        } else {
          this.$message.error('请完整填写收货信息')
          return false
        }
      })
    }
  },
  computed: {
    totalPrice () {
      let sum = 0
      for (let i = 0; i < this.orderList.length; i++) {
        sum += this.orderList[i].price * this.orderList[i].quantity
      }
      // eslint-disable-next-line vue/no-side-effects-in-computed-properties
      this.account = sum
      return sum
    }
  },
  filters: {
    dot: function (value) {
      if (!value) return '0.00'
      else {
        return value.toFixed(2)
      }
    }
  }
}
</script>

<style scoped>
.checkout-view{
  width: 100%;
  overflow: hidden;
  margin-bottom: 50px;
}
.headerarea{
  width: 100%;
  height: 100px;
  background: white;
  color: #333333;
}
.logo{
  height: 100%;
  display: flex;
}
.logo>img{
  max-width: 50%;
  display: block;
  height: auto;
  margin: auto 0;
}
.page-title{
  margin: auto;
  font-size: 18px;
  position: relative;
  top: 10px;
}
/deep/ .el-col {
  margin: auto 0;
}
.order-main{
  border:1px solid #e6e6e6;
  padding: 0 24px;
}
.receiver-info,.pay-method,.order-info,.detail{
  width: 100%;
  border-bottom: 1px solid #e6e6e6;
  font-size: 14px;
  overflow: hidden;
  padding: 18px 0;
}
.receiver-info{
  height: 100px;
}
.pay-method{
  height: 60px;
}
.detail{
  border-bottom: none;
  overflow: hidden;
  text-align: right;
  background-color: #f4f4f4;
  padding: 18px 24px;
  box-sizing: border-box;
  margin-top: 15px;
  line-height: 24px;
}
/*.detail>div{*/
/*  margin: 5px 0;*/
/*}*/
.rec-title>span,.pay-title,.order-title{
  font-weight: 700;
}
.order-title{
  margin-bottom: 15px;
}
.rec-info,.pay-ways{
  padding: 12px 15px 10px;
  display: flex;
  color: #606266;
}
.rec-info>span{
  display: inline-block;
  margin: auto 12px auto 0;
}
.checked{
  padding: 5px;
  border: 2px solid #e1251b;
}
.non-checked{
  padding: 5px;
  border: 2px solid transparent;
}
.pay-ways>span{
  display: inline-block;
  margin: auto 10px auto 0;
  cursor: pointer;
}
.rec-link{
  padding-left: 15px;
  color: #606266;
  cursor: pointer;
}
.non-checked{
  border: 2px solid transparent;
}
.el-dropdown-link{
  cursor: pointer;
}
.el-dropdown-link:hover,
.el-dropdown-link:hover .el-icon-d-arrow-right{
  color: #e1251b;
  text-decoration: underline;
}
.order-item{
  width: 100%;
  height: 80px;
  display: flex;
  margin: 5px 0;
  overflow: hidden;
  background-color: #f6f6f6;
}
.item-title{
  flex: 1;
  margin: auto;
}
.item-price,.item-num,.item-amount{
  flex: 0 0 110px;
  margin: auto 0;
  line-height: 1;
  text-align: center;
}
.item-img{
  flex: 0 0 100px;
  margin: auto;
}
.item-img>img{
  height: 64px;
  width: auto;
  display: block;
  margin: auto;
}

.topay{
  display: inline-block;
  width: 136px;
  line-height: 40px;
  border-radius: 3px;
  font-size: 18px;
  text-align: center;
  height: 40px;
  background-color: #e1251b;
  color: #FFFFFF;
  font-weight: bold;
  float: right;
  margin: 18px 24px 0;
}
.topay:hover{
  color: #FFFFFF;
  background: rgba(225,37,27,.9);
}
</style>
