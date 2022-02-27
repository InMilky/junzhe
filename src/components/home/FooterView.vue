<template>
    <div id="footer">
      <el-row type="flex" justify="center">
        <el-col :span="20">
          <el-row type="flex" justify="space-between">
            <el-col :span="5" class="service-item">
                <div class="service-tit service-mode-duo">多</div>
                <div class="service-txt">品类齐全，轻松购物</div>
              </el-col>
            <el-col :span="5" class="service-item">
                <div class="service-tit service-mode-kuai">快</div>
                <div class="service-txt">多仓直发，极速配送</div>
                </el-col>
            <el-col :span="5" class="service-item">
                <div class="service-tit service-mode-hao">好</div>
                <div class="service-txt">正品行货，精致服务</div>
            </el-col>
            <el-col :span="5" class="service-item">
                  <div class="service-tit service-mode-sheng">省</div>
                  <div class="service-txt">天天低价，畅选无忧</div>
                  </el-col>
          </el-row>
        </el-col>
      </el-row>
      <el-row type="flex" justify="center" style="border-top: 1px solid #d4d4d4;">
        <el-col :span="20">
          <el-row type="flex" justify="space-between">
            <el-col :span="4" class="help-nav" v-for="list in helpLists" :key="list.key">
              <el-card class="help-nav-tit" shadow="never">
                <div slot="header" class="clearfix">
                  <span>{{list.title}}</span>
                </div>
                <el-link v-for="item in list.data" :key="item" class="help-nav-link" :underline="false">
                  {{ item }}
                </el-link>
              </el-card>

            </el-col>
            <el-col :span="7" class="help-nav">
              <el-card class="help-code-tit" shadow="never">
                <div slot="header" class="clearfix"><span>关于我们</span></div>
                <el-link class="erweima" :underline="false">
                  <img src="../../assets/img/index/erweima.png" alt="erweima">
                </el-link>
              </el-card>
              <el-card class="help-code-tit" shadow="never">
                <div slot="header" class="clearfix"><span>关注公众号</span></div>
                <el-link class="erweima" :underline="false">
                  <img src="../../assets/img/index/erweima.png" alt="erweima">
                </el-link>
              </el-card>
            </el-col>
          </el-row>
        </el-col>
      </el-row>
      <CopyRight></CopyRight>
    </div>
</template>
<script>
import CopyRight from '@/components/home/CopyRight'
export default {
  name: 'FooterView',
  data () {
    return {
      helpLists: [
        { key: 1, title: '购物指南', data: ['免费注册', '购物流程', '会员介绍', '常见问题', '联系客服'] },
        { key: 1, title: '售后保障', data: ['发票保障', '价格保护', '退款说明', '缺货赔付', '返修换货'] },
        { key: 1, title: '支付方式', data: ['货到付款', '快捷支付', '分期付款', '公司转账'] },
        { key: 1, title: '特色服务', data: ['延保服务', '物流服务', '运营服务', '商家中心', '藏宝阁'] }
      ]
    }
  },
  components: {
    CopyRight
  }
}
</script>

<style scoped>
#footer{
  width: 100%;
  height: 1000px;
  overflow: hidden;
  margin: 0;
  padding: 0;
  background-color: #dddddd;
}
/deep/ .el-row{
  margin: 20px 0;
}
/deep/ .el-card{
  background: transparent;
  border: none;
  margin: 20px 0 0;
}
/deep/ .el-card__header{
  padding:0 0 8px;
  border: none;
  font-size: 14px;
  color: #666;
}
/deep/ .el-card__body{
  padding: 0;
}
.help-nav-link{
  display: block;
  padding: 2px 0;
  font-size: 12px;
  letter-spacing: 2px;
}
/deep/ .el-link{
  font-weight: normal;
  font-size: 12px;
}
/deep/ .el-link.el-link--default:hover{
  color: #e1251b;
}
.service-item{
height: 42px;
display: flex;
justify-content: space-around;
}
.service-tit,.service-txt{
margin: auto;
}
.service-txt{
font-size: 18px;
font-weight: 700;
text-align: center;
}
.service-tit{
width: 38px;
height: 42px;
text-indent: -999px;
overflow: hidden;
}
#footer .service-mode-duo,.service-mode-kuai,.service-mode-hao,.service-mode-sheng{
background-size: 113px 86.5px;
background-image: url("../../assets/img/index/footer-service.png");
background-repeat: no-repeat;
}
.service-mode-duo{
background-position: 0 0;
}
.service-mode-kuai{
background-position: -38.5px 0;
}
.service-mode-hao{
background-position: -77px 0;
}
.service-mode-sheng{
background-position: 0 -44.5px;
}

.help-nav{
  text-align: center;
  margin-bottom: 10px;
}
.help-nav-tit,.help-code-tit{
  font-weight: bold;
}
.help-code-tit{
  display: inline-block;
  width: 30%;
}
.erweima{
  width: 100%;
  display: inline-block;
}
.erweima img{
  width: 90%;
  height: auto;
  margin-top: 10px;
  display: inline;
}
</style>
