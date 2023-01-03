import io.appium.java_client.ios.IOSDriver;
import org.junit.Before;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;

import java.net.MalformedURLException;
import org.junit.After;
import org.junit.Test;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.net.URL;

public class MyFirstTest {
    IOSDriver driver;

    @Before
    public  void capabilityMilo() throws MalformedURLException {
        DesiredCapabilities capabilities = new DesiredCapabilities();
        capabilities.setCapability("deviceName", "iPhone");
        capabilities.setCapability("udid", "7e514e28f6cd619a901bc284b5a2779e681b8284");
        capabilities.setCapability("automationName", "XCUITest");
        capabilities.setCapability("platformName", "ios");
        capabilities.setCapability("bundleId", "vn.ogilvy.testflight.milo30");
        driver = new IOSDriver(new URL("http://127.0.0.1:4723/wd/hub"), capabilities);

    }
    @After
    public void  turnOffMilo(){
        //driver.quit();
    }
    @Test
    public void runMilo()throws Exception{
        try {
            driver.findElementByXPath("//XCUIElementTypeApplication[@name=\"Milo3.0\"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton").click();
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            driver.findElementByAccessibilityId("continue_button").click();
        } catch (Exception e) {
            e.printStackTrace();
        }


        WebDriverWait wait = new WebDriverWait(driver, 30);
        wait.until(ExpectedConditions.elementToBeClickable(By.name("login_label")));


        try {
            driver.findElementByAccessibilityId("login_label").click();
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            driver.findElementByAccessibilityId("email_textfield").sendKeys("ngocan.task1@yopmail.com");
            driver.findElementByAccessibilityId("password_textfield").sendKeys("An123456!@");
            driver.findElementByAccessibilityId("submit_button").click();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
