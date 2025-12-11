use open_dp100::{OpenDP100, OutputState};
use std::time::Duration;

fn main() {
    let count = OpenDP100::device_count().expect("Get Device failed");
    if count == 0 {
        println!("Device Not found");
        return;
    }
    let api = OpenDP100::new(0).unwrap();

    if let Ok(sys_info) = api.sys_info() {
        println!("{:?}", sys_info);
    } else {
        println!("No sys_info!");
    }

    if let Ok(device_info) = api.device_info() {
        println!("{:?}", device_info);
    } else {
        println!("No device_info!");
    }

    if let Ok(basic_info) = api.basic_info() {
        println!("{:?}", basic_info);
    } else {
        println!("No basic_info!");
    }

    if let Ok(current_basic_set) = api.current_basic_set() {
        println!("{:?}", current_basic_set);
    } else {
        println!("No current_basic_set!");
    }

    api.switch_config(6).unwrap();

    api.set_output_on(OutputState::On).unwrap();
    std::thread::sleep(Duration::from_secs(3));
    api.set_output_on(OutputState::Off).unwrap();
}
