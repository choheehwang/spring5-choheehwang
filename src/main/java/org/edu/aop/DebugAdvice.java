package org.edu.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * DebugAdvice class로써, advice라는 AOP 기능을 사용하여 디버그 실행
 * @author 황초희
 *
 */
@Component
@Aspect
public class DebugAdvice {
	private static final Logger logger = LoggerFactory.getLogger(DebugAdvice.class);
	/**
	 * @throws Throwable 
	 * @Around 애노테이션 클래스는 메서드 실행에 직접 관여
	 * Around class 
	 */
	@Around("execution(* org.edu.controller.AdminController.*(..))")
	public Object timeLog(ProceedingJoinPoint pjp) throws Throwable {
		logger.debug("AOP 디버그 시작 =================== ");
		long startTime = System.currentTimeMillis(); // 현재 컴퓨터 시간을 저장하는 변수
		logger.debug(Arrays.toString(pjp.getArgs())); // pjp class 매개변수값 GET으로 가져와 toString으로 형 변환
		Object result = pjp.proceed();
		long endTime = System.currentTimeMillis();
		logger.debug(pjp.getSignature().getName() + "메서드의 실행 시간은 " + (endTime-startTime));
		logger.debug("AOP 디버그 끝 =================== ");
		return result;
	}
}
