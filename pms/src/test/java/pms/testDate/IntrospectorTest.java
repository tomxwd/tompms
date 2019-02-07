package pms.testDate;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import top.tomxwd.pms.pojo.sysuser.Sysuser;

public class IntrospectorTest {
	public static void main(String[] args) throws IntrospectionException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		BeanInfo info = Introspector.getBeanInfo(Sysuser.class);
		BeanInfo info2 = Introspector.getBeanInfo(Sysuser.class, Object.class);
		PropertyDescriptor[] desc = info.getPropertyDescriptors();
		for (PropertyDescriptor d : desc) {
			System.out.println(d);
		}
		System.out.println("-------------------------");
		PropertyDescriptor[] desc2 = info2.getPropertyDescriptors();
		for (PropertyDescriptor d : desc2) {
			System.out.println(d.getName());
			System.out.println(d.getPropertyType());
			System.out.println(d.getReadMethod());
			System.out.println(d.getDisplayName());
			System.out.println(d.getShortDescription());
			System.out.println(d.getValue("delstatus"));
			System.out.println(d.getPropertyEditorClass());
			System.out.println(d.getWriteMethod());
			System.out.println("-------");
		}
		Sysuser user = new Sysuser();
		Method setter = desc2[2].getWriteMethod();
		System.out.println(setter);
		setter.invoke(user, "user11");
		System.out.println(user);
	}
}
