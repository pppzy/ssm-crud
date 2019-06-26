import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itpzy.dao.EmpMapper;
import com.itpzy.domain.Emp;
import com.itpzy.service.EmpService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:ApplicationContext.xml")
public class DaoTest {

    @Autowired
    private EmpService empService;

    @Autowired
    private EmpMapper empMapper;

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    private int i=0;




    /**
     * 测试能否操作数据库
     */
    @Test
    public void TestDao(){
        Emp emp = empMapper.selectByPrimaryKeyWithDept(1);
        System.out.println(emp);
    }

    /**
     * 测试往数据库表加入数据
     */
    @Test
    public void TestDao2(){
        Emp emp = new Emp(null,"Json","男","@163.com",1);
        empMapper.insertSelective(emp);
    }

    /**
     * 批量执行Sql语句
     */
    @Test
    public void TestDao3(){
        EmpMapper mapper = sqlSessionTemplate.getMapper(EmpMapper.class);
        for(int i=0;i<1000;i++){
            String username = UUID.randomUUID().toString().substring(0, 5)+i;
            Emp emp = new Emp(null,username,"男",username+"@163.com",1);
            mapper.insertSelective(emp);
        }
    }

    @Test
    public void TestService4(){
        Emp empsById = empService.getEmpsById(1);
        System.out.println(empsById);
    }

    @Test
    public void TestService5(){

        PageHelper.startPage(1,5);
        List<Emp> emps = empService.getEmps();
        PageInfo pageInfo = new PageInfo(emps,5);
        System.out.println(pageInfo);



    }


}
