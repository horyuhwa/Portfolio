using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APISun
{
    public class Sun
    {
        public string location { get; set; }
        public int locdate { get; set; }    
        public int sunrise { get; set; }    
        public int sunset { get; set; }
    }
}

//http://apis.data.go.kr/B090041/openapi/service/RiseSetInfoService/getAreaRiseSetInfo?ServiceKey=POhABzIpaBdsd68TyYxCpXEYEaOFzEl2uUSVzW0mf7RCsIaszjXz8p5LspD9momiWBYKhXLB8uhO5GSezu4blQ%3D%3D&locdate=20150101&location=%EC%84%9C%EC%9A%B8
