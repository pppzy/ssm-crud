import com.github.pagehelper.PageInfo;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml","classpath:springmvc.xml"})
public class MockMVCTest {

    @Autowired
    WebApplicationContext context;

    MockMvc mockMVc;

    /**
     * 每次测试前初始化 MockMVC对象
     */
    @Before
    public void initMockMVC(){
        mockMVc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testControl() throws Exception{
        //执行虚拟化的MVC请求，并获得返回值
        MvcResult result = mockMVc.perform(MockMvcRequestBuilders.get("/emp/getEmp").param("pageNum", "1")).andReturn();

        //获得request请求域
        MockHttpServletRequest request = result.getRequest();

        //从域中获取对应的参数
        PageInfo results = (PageInfo) request.getAttribute("pageinfo");
        //当前页
        int pageNum = results.getPageNum();
        //总共的页数
        int pages = results.getPages();
        //总共的记录数
        long total = results.getTotal();
        //分页的页数
        int[] navigatepageNums = results.getNavigatepageNums();
        for (int navigatepageNum : navigatepageNums) {
            System.out.println(navigatepageNum);
        }
        System.out.println("当前页"+pageNum+" ,总共的页数"+pages+" ,总共的记录数"+total);
    }
}
