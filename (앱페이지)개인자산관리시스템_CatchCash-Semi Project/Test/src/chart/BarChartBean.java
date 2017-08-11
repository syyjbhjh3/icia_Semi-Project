package chart;
 
import org.jfree.chart.*;
import org.jfree.data.category.*;
import org.jfree.chart.renderer.category.*;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.*;
import java.awt.*;
 
/**
 * FileName : BarChartBean.java
 * Comment  : 
 * @version : 1.0
 * @author  : sunshiny
 * @date    : 2011. 1. 5.
 */
public class BarChartBean {
 
    public static void main(String arg[]){
        BarChartBean bcb = new BarChartBean();
 
        JFreeChart chart = bcb.getBarChart();
        ChartFrame frame1 = new ChartFrame("Bar Chart",chart);
        frame1.setSize(700,250);  
        frame1.setVisible(true);
        frame1.setLocation(100, 200);
 
    }
 
    public JFreeChart getBarChart() {
        String titleStr = "차트 타이틀";
 
        // row keys...
        final String series1 = "First";
        //        final String series2 = "Second";
        //        final String series3 = "Third";
 
        // column keys...
        final String category1 = "서울";
        final String category2 = "부산";
        final String category3 = "대구";
        final String category4 = "인천";
        final String category5 = "광주";
        final String category6 = "대전";
        final String category7 = "울산";
        final String category8 = "경기";
        final String category9 = "강원";
        final String category10 = "충북";
        final String category11 = "충남";
        final String category12 = "전북";
        final String category13 = "전남";
        final String category14 = "경북";
        final String category15 = "경남";
        final String category16 = "제주";
 
        // create the dataset...
        final DefaultCategoryDataset dataset = new DefaultCategoryDataset();
 
        dataset.addValue(1.0, series1, category1);
        dataset.addValue(5.0, series1, category2);
        dataset.addValue(4.0, series1, category3);
        dataset.addValue(27.0, series1, category4);
        dataset.addValue(30.0, series1, category5);
        dataset.addValue(10.0, series1, category6);
        dataset.addValue(11.0, series1, category7);
        dataset.addValue(7.0, series1, category8);
        dataset.addValue(2.0, series1, category9);
        dataset.addValue(16.0, series1, category10);
        dataset.addValue(19.0, series1, category11);
        dataset.addValue(22.0, series1, category12);
        dataset.addValue(23.0, series1, category13);
        dataset.addValue(27.0, series1, category14);
        dataset.addValue(31.0, series1, category15);
        dataset.addValue(12.0, series1, category16);
 
        JFreeChart chart = ChartFactory.createBarChart(titleStr, "", ""
                , dataset, PlotOrientation.VERTICAL, true,true, false);
 
        /**
         * Chart 폰트 설정, 클래스 파일 위치 : package org.jfree.chart.StandardChartTheme.java
         *      
         */
        chart.getTitle().setFont(new Font("sansserif", Font.BOLD, 20));
        chart.getLegend().setItemFont(new Font("sansserif", Font.BOLD, 15));
        chart.getCategoryPlot().setNoDataMessageFont(new Font("sansserif", Font.BOLD, 15));
        chart.getPlot().setNoDataMessageFont(new Font("sansserif", Font.BOLD, 15));
 
        System.out.println(chart.getPlot().getNoDataMessageFont().getName());
 
        chart.setBackgroundPaint(Color.WHITE);
        chart.getTitle().setPaint(Color.orange);
 
        StandardCategoryItemLabelGenerator stdCateGen 
        = new StandardCategoryItemLabelGenerator();
        BarRenderer barRender = new BarRenderer();
 
        CategoryPlot plot = chart.getCategoryPlot();
 
        barRender.setItemLabelGenerator(stdCateGen); // 그래프별 값 출력
        plot.setRenderer(barRender);                 // 그래프별 값 출력
 
        /*      plot.setDomainAxis(new CategoryAxis("지역"));
        plot.setRangeAxis(new NumberAxis("수치"));
        plot.setOrientation(PlotOrientation.VERTICAL);
         */
 
        //      plot.setDomainGridlinesVisible(true);
        plot.setRangeGridlinesVisible(true); // 가로 그리드 라인 보이기
 
        plot.setRangeGridlinePaint(Color.GRAY); 
        plot.setBackgroundPaint(Color.WHITE);
 
        // set the range axis to display integers only...
        final NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
        rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
        rangeAxis.setUpperMargin(0.40);
 
        // disable bar outlines...
        final CategoryItemRenderer renderer = plot.getRenderer();
        renderer.setSeriesItemLabelsVisible(0, Boolean.TRUE);
 
        final CategoryAxis domainAxis = plot.getDomainAxis();
        // x축 문자열 회전(STANDARD, UP_45, UP_90,DOWN_45,DOWN_90)
        domainAxis.setCategoryLabelPositions(CategoryLabelPositions.STANDARD); 
        domainAxis.setLowerMargin(0.01d);
        domainAxis.setUpperMargin(0.01d);
        domainAxis.setCategoryMargin(0.30);
 
        return chart;
    }
}
