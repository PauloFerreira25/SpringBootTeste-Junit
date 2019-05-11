package com.example.junit;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class JunitApplicationTests {

	@Test
	public void contextLoads() {
	}

	@Test
	public void twoPlusTwoTest() {
		assertEquals(4, 2 + 2);
	}

}
