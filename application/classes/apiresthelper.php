<?php
/*wrapper for the cURL call   */
class ApiRestHelper
    {
        public static function createApiCall($url, $method, $headers=array(), $data = array())
        {
           
            if ($method == 'PUT')
            {
                $headers[] = 'X-HTTP-Method-Override: PUT';
            }

            $headers = self::mergeArray(array("Cache-Control: no-cache"), $headers);
            $handle = curl_init();
            curl_setopt($handle, CURLOPT_URL, $url);
            curl_setopt($handle, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($handle, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($handle, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($handle, CURLOPT_FRESH_CONNECT, true);

            switch($method)
            {
                case 'GET':
                    curl_setopt($handle, CURLOPT_POST, false);
                    break;
                case 'POST':
                    curl_setopt($handle, CURLOPT_POST, true);
                    curl_setopt($handle, CURLOPT_POSTFIELDS, http_build_query($data));
                    break;
                case 'PUT':
                    curl_setopt($handle, CURLOPT_CUSTOMREQUEST, 'PUT');
                    curl_setopt($handle, CURLOPT_POSTFIELDS, http_build_query($data));
                    break;
                case 'DELETE':
                    curl_setopt($handle, CURLOPT_CUSTOMREQUEST, 'DELETE');
                    break;
            }
            $response = curl_exec($handle);
            return $response;
        }
        
        
        public static function mergeArray($a,$b)
	{
                if (empty($b)) return $a;
		$args=func_get_args();
		$res=array_shift($args);
		while(!empty($args))
		{
			$next=array_shift($args);
			foreach($next as $k => $v)
			{
				if(is_integer($k))
					isset($res[$k]) ? $res[]=$v : $res[$k]=$v;
				elseif(is_array($v) && isset($res[$k]) && is_array($res[$k]))
					$res[$k]=self::mergeArray($res[$k],$v);
				else
					$res[$k]=$v;
			}
		}
		return $res;
	}
    }