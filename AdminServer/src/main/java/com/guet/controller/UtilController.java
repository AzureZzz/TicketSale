package com.guet.controller;

import com.guet.entity.BusTicketInfo;
import com.guet.entity.TrainTicket;
import com.guet.entity.TrainTicketInfo;
import com.guet.service.IBusTicketService;
import com.guet.service.ITrainTicketService;
import jxl.Workbook;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@Controller
public class UtilController {

    @Autowired
    private IBusTicketService busTicketService;

    @Autowired
    private ITrainTicketService trainTicketService;

    @RequestMapping(value = "download/{mode}",method = RequestMethod.GET)
    public void downloadExl(@PathVariable(value = "mode") String mode,
                            HttpServletResponse response){
        // 创建工作表
        WritableWorkbook book=null;
        response.reset();
        // 创建工作流
        OutputStream os =null;
        try {
            // 设置弹出对话框
            response.setContentType("application/DOWNLOAD");
            // 设置工作表的标题
            response.setHeader("Content-Disposition", "attachment; filename=download.xls");//设置生成的文件名字
            os  = response.getOutputStream();
            // 初始化工作表
            book = Workbook.createWorkbook(os);
        } catch (IOException e1) {
            e1.printStackTrace();
        }
        try{
            if(mode.equals("1")){
                List<BusTicketInfo> infos = busTicketService.getSaleBusTicket();
                WritableSheet sheet = book.createSheet("汽车票销售表", 0);
                // 表字段名
                sheet.addCell(new jxl.write.Label(0, 0, "始发站"));
                sheet.addCell(new jxl.write.Label(1, 0, "终点站"));
                sheet.addCell(new jxl.write.Label(2, 0, "车型"));
                sheet.addCell(new jxl.write.Label(3, 0, "出发时间"));
                sheet.addCell(new jxl.write.Label(4, 0, "座位号"));
                sheet.addCell(new jxl.write.Label(5, 0, "价格"));
                sheet.addCell(new jxl.write.Label(6, 0, "车次"));
                // 添加数据
                for(int i=0;i<infos.size();i++){
                    sheet.addCell(new jxl.write.Label(0, i+1, infos.get(i).getStartStation()));
                    sheet.addCell(new jxl.write.Label(1, i+1, infos.get(i).getDesStation()));
                    sheet.addCell(new jxl.write.Label(2, i+1, infos.get(i).getBusType()));
                    sheet.addCell(new jxl.write.Label(3, i+1, infos.get(i).getGoOff().toString()));
                    sheet.addCell(new jxl.write.Label(4, i+1, infos.get(i).getSeatNo()+""));
                    sheet.addCell(new jxl.write.Label(5, i+1, infos.get(i).getPiece()+""));
                    sheet.addCell(new jxl.write.Label(6, i+1, infos.get(i).getNumNo()));
                }
            }else if(mode.equals("2")){
                List<TrainTicketInfo> infos = trainTicketService.getSaleTrainTicket();
                WritableSheet sheet = book.createSheet("火车票销售表", 0);
                // 表字段名
                sheet.addCell(new jxl.write.Label(0, 0, "出发发站"));
                sheet.addCell(new jxl.write.Label(1, 0, "到达车站"));
                sheet.addCell(new jxl.write.Label(2, 0, "座位类型"));
                sheet.addCell(new jxl.write.Label(3, 0, "座位信息"));
                sheet.addCell(new jxl.write.Label(4, 0, "出发时间"));
                sheet.addCell(new jxl.write.Label(5, 0, "到达时间"));
                sheet.addCell(new jxl.write.Label(6, 0, "车次"));
                sheet.addCell(new jxl.write.Label(7, 0, "价格"));
                // 添加数据
                for(int i=0;i<infos.size();i++){
                    sheet.addCell(new jxl.write.Label(0, i+1, infos.get(i).getStartStation()));
                    sheet.addCell(new jxl.write.Label(1, i+1, infos.get(i).getDesStation()));
                    sheet.addCell(new jxl.write.Label(2, i+1, infos.get(i).getSeatType()));
                    sheet.addCell(new jxl.write.Label(3, i+1, infos.get(i).getSeatNo()));
                    sheet.addCell(new jxl.write.Label(4, i+1, infos.get(i).getGoOff().toString()));
                    sheet.addCell(new jxl.write.Label(5, i+1, infos.get(i).getArriveTime().toString()));
                    sheet.addCell(new jxl.write.Label(6, i+1, infos.get(i).getTrainNo()));
                    sheet.addCell(new jxl.write.Label(7, i+1, infos.get(i).getPiece()+""));
                }
            }
            book.write();
            book.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
