Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1C20C3799E1
	for <lists+cluster-devel@lfdr.de>; Tue, 11 May 2021 00:17:02 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-nd_yuFqGMWivMYKT00lgSg-1; Mon, 10 May 2021 18:16:59 -0400
X-MC-Unique: nd_yuFqGMWivMYKT00lgSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3E379F92A;
	Mon, 10 May 2021 22:16:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AE6D5D6D1;
	Mon, 10 May 2021 22:16:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3680B1800B8A;
	Mon, 10 May 2021 22:16:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14AMGnYS020556 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 10 May 2021 18:16:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3973E6D9D5; Mon, 10 May 2021 22:16:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 333786D9EC
	for <cluster-devel@redhat.com>; Mon, 10 May 2021 22:16:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67D07182BBC0
	for <cluster-devel@redhat.com>; Mon, 10 May 2021 22:16:46 +0000 (UTC)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-105-UGHgJdPmOca7KcdbWO-OOA-1; Mon, 10 May 2021 18:16:43 -0400
X-MC-Unique: UGHgJdPmOca7KcdbWO-OOA-1
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	14ALxlVR003995; Mon, 10 May 2021 22:16:42 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2130.oracle.com with ESMTP id 38dg5bcxye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 May 2021 22:16:41 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	14ALxZ1T110903; Mon, 10 May 2021 22:16:41 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
	(mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
	by userp3030.oracle.com with ESMTP id 38dfrw6j5d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 May 2021 22:16:41 +0000
Received: from SJ0PR10MB4752.namprd10.prod.outlook.com (2603:10b6:a03:2d7::19)
	by BY5PR10MB4274.namprd10.prod.outlook.com (2603:10b6:a03:206::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29;
	Mon, 10 May 2021 22:16:38 +0000
Received: from SJ0PR10MB4752.namprd10.prod.outlook.com
	([fe80::7865:7d35:9cee:363f]) by
	SJ0PR10MB4752.namprd10.prod.outlook.com
	([fe80::7865:7d35:9cee:363f%5]) with mapi id 15.20.4108.031;
	Mon, 10 May 2021 22:16:38 +0000
To: Andrew Morton <akpm@linux-foundation.org>
References: <20210426220552.45413-1-junxiao.bi@oracle.com>
	<20210509162306.9de66b1656f04994f3cb5730@linux-foundation.org>
From: Junxiao Bi <junxiao.bi@oracle.com>
Message-ID: <4d120e2e-5eb4-1bbb-cc63-8c3b7c62dac0@oracle.com>
Date: Mon, 10 May 2021 15:15:27 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <20210509162306.9de66b1656f04994f3cb5730@linux-foundation.org>
X-Originating-IP: [73.231.9.254]
X-ClientProxiedBy: SA0PR11CA0071.namprd11.prod.outlook.com
	(2603:10b6:806:d2::16) To SJ0PR10MB4752.namprd10.prod.outlook.com
	(2603:10b6:a03:2d7::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dhcp-10-159-227-171.vpn.oracle.com (73.231.9.254) by
	SA0PR11CA0071.namprd11.prod.outlook.com (2603:10b6:806:d2::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24
	via Frontend Transport; Mon, 10 May 2021 22:16:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e94c67db-cbfb-49e2-3b83-08d9140147bb
X-MS-TrafficTypeDiagnostic: BY5PR10MB4274:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB427462971ADB9F1A83C67E4AE8549@BY5PR10MB4274.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: MZhRFYVFUqr9WIUa4VkP2KOugeLVZFRuxoLIHXo3utKBJ59mihskMy/dypFk8g/jHFdW4IkhNP/ZB0T6vztIW/JDQEH5uttZf2l060hZ2opRXi9Al4h0ZPqZgnZWVpjE5YaLZw3ng7n1ogDeVZgLzmxqoxthbjxUk7YDY9CaH7NoKEoSfrMg8IcnfDj9sYHsrG4vFzjmF8kY5XzKuIwTiQUYraIKXgAEkaqFtdITjzDflMdFl8IwDCEHurHANuC5Jl1Wx/ayNPb3UyQSi3+AL7ouqYzEjiHyTO3rhgb6EfrshFor2Zs349vd4F8Z7hIgP3gOAi1rXhe7ma4H5QuBY1M6sJM00Xum64QMYbjIGfhAhMPdCx0aX9LykblP1ipFQD1XQY2n61Rsqe63XOqLPtUSc1cnce2e9563PABgDK2b/+/KFJUHiW7MX8ZznSxt1vqEUOY3EO3jQ713IJEXxuMFZjH6N4PKRTo8DO5qsLXCHjaDohd0IOmPhZdNIrpbAvocaSTu6y3bPMixLhnSEuhp1tM2R3jDAL5WxK5TtTxHZmdiIbQrB7o6txm/h0LpKZYn9hnCs4YxTGaMK/yXcS0iTf7MHhaQFVhNyquu4cpp6OJ21KTjS9dYIxSfW46RaZWQ7PkxIr1LkH0rrv7ZlckckCf/aOXTEEMyhgLNb80En3MU4VH3E0LBHe1s26QH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SJ0PR10MB4752.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(376002)(396003)(366004)(346002)(136003)(39860400002)(5660300002)(16526019)(316002)(186003)(478600001)(7696005)(2616005)(4326008)(8676002)(53546011)(8936002)(956004)(26005)(86362001)(6486002)(38100700002)(66476007)(6666004)(83380400001)(4744005)(31686004)(31696002)(2906002)(6916009)(66556008)(66946007)(44832011)(36756003)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cWl6UEE3a1dxWWJ2Zk5hRG5xMmJmTFhVRWt4VnVUMG1GcTFoQWZHamtkVDdx?=
	=?utf-8?B?RXpvZHBobEVROEYyd2NLdDBIMkZDTmd3VjZ1cDFLbE42OUh2Rjh5eExpSVAv?=
	=?utf-8?B?MHU5R1MxSExXTEQ2RUV1cHlUVGs2Mk5ZV09LaXNjN0RDRFZ0SXBYdWpkMFV1?=
	=?utf-8?B?UUZwNklIUEhDUmdCZlNUakdHZHdXQk5jSjYxcTFhRTl2M2NKOUpuWTlPNUxa?=
	=?utf-8?B?eFZHM2ZGZ2VIcW51SFd2TnJHN0MySkF0Mm1YV0t4cjFtbXIzTGlnVTkzd0l2?=
	=?utf-8?B?amxPM1ZCVnh0MjlhTUIvZ1RlbXVzNjV0SEhPVVJEb2VYdmFiYlF4WXFXdHRD?=
	=?utf-8?B?OFU2ZDcxbG81K3dGcmtqTU5PVTlCYlNmN1oxV1hKSGhYMVFtUGE4MFRXS3Zq?=
	=?utf-8?B?UFNnV0grYkNIcXY2SlZPU2JBZXFEKzNXbld5bklWak5JUFNlV1h1ekRJYkll?=
	=?utf-8?B?WWwwamRaenlEa1lMS1JzZkdsTGUrNHVrT0VBNkVWN1djMWZvZlh4NFdmd2I5?=
	=?utf-8?B?SGJTMmQwSnFZS2FQelM5RHF2N2Y0cEViOEs2TXBCbjJXUFEwUldTaiswV2xF?=
	=?utf-8?B?VkxMZG0wb1VxY2hHU1U1QzBJL2c0VkdPd0liTFZyQXQrd3dJOHBrYXNvVmlw?=
	=?utf-8?B?SFNBdGYzcStFTEZUaEx1K1RZK3ZQeFRMMkhiRkxlSEFXL1dtSTlpeUxKQkY4?=
	=?utf-8?B?aUNZRGJPelJMVDJJK3NEV1BWdDFzQ1R0WFZBenVLS2hqY3pnTXUxbEhqRURE?=
	=?utf-8?B?emh3M2l4QzZFNlByZDd0cWl0Zzd0THJXcVFSNXQvTytscnUvblVYc1FINVEw?=
	=?utf-8?B?RXYvOXJNTXVQdHBBaHU3WjI0SCt1cmtodzRsK3ZBbllSQXhKM3BGS0Y2SGxC?=
	=?utf-8?B?WlFSOVRBdVVrNWxRZTgwVnU3RlBEVy8zV0NEcWFBMTQ1V0dWU3BIMWtwRHNa?=
	=?utf-8?B?Mm9yVmt5cW1yaFRTaHFUUEh3NVduMUN4S2dCWXBNeldHczVsTHI4aHBmRS9N?=
	=?utf-8?B?SFA1OGlLSVRVeWtmUllCa2lMcGQ4aUFHMXhuQklGTURvVDB3YkdmVkFjdTdO?=
	=?utf-8?B?b3Vpc1R1bytQcTRWVE1FRHJ1b0hmYkgvZjIvUFQzTzZlMUlaL25kTjI3RmhX?=
	=?utf-8?B?SVFYQ290K0hXQjdZWVV2SGRuMzlyWnczVTFpNnNWYmMrMFM0Q3REbjdlNTZN?=
	=?utf-8?B?Zk9iWVBIWjVEcjZXNWFqUk5KZHhKOVVxTTg0b0hScjRqTmxMU2daUnc2dmZG?=
	=?utf-8?B?NWJkNVJVZkl5ZkxRemZ5TmJyV2I1NkRyUk1Ea0gxaHBVdHVtRHgvaCtBNGdl?=
	=?utf-8?B?RGlGa3NhWDdsWFVBRStqQ0NWOUpxQXErTHpIQUtLZHRPYTY2UTQ5Z0RzaTRt?=
	=?utf-8?B?Yk1zZGxLZVN2MG0wYmg4WEFVd3FERkpWVENQZHNtcUlFZ0dlLytveC82QVBl?=
	=?utf-8?B?VUlsRHRoS2ZNeDY0R3h3a2pLKytvRHMrL0I2dWxWME5oSmtTbDY4VVhMeHpj?=
	=?utf-8?B?S291RlJZM3pRTk5VSUxhR2x0d0JZb0FQVk1jejVjU08wSHpzaFMxdThrS3Z3?=
	=?utf-8?B?K0o1ZURDYm50eHFxOGZoOERHL2JpSExLNnRhRE1LM0lWcno1aUM3bm9KdFMx?=
	=?utf-8?B?LzhzS0tsOGR3V3k2MDVoaDZrcW41WWgwbS9zajZ2ZDQ0bk50T2prTk93ejhH?=
	=?utf-8?B?bktmaU5rU0FMNzVoa29ZR0svbWkvVlhnNTZ4V1lGVXVCeWZiTkZ4WUFiRTRh?=
	=?utf-8?Q?k3RTLaAuLP/LOv5P0JWq3CiRC6OJ4TbAuTGwKtD?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e94c67db-cbfb-49e2-3b83-08d9140147bb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4752.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 22:16:38.2134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IggfOIr7C/U6W3qrA4B0pjxXWytc9d5kVY6c/BIJkFtYYKrNHHi6O+20F92U6Iz2fEZRKcnuroAit/KyiClmDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4274
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9980
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
	phishscore=0
	adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
	spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2104190000 definitions=main-2105100149
X-Proofpoint-GUID: SCtTPBEI5NBDoralwuBxe9Ly-QMdmJc8
X-Proofpoint-ORIG-GUID: SCtTPBEI5NBDoralwuBxe9Ly-QMdmJc8
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9980
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	lowpriorityscore=0 malwarescore=0
	bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
	mlxlogscore=999 mlxscore=0 suspectscore=0 impostorscore=0 phishscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2104190000 definitions=main-2105100149
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	Jan Kara <jack@suse.cz>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [Ocfs2-devel] [PATCH 1/3] fs/buffer.c: add new
 api to allow eof writeback
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 5/9/21 4:23 PM, Andrew Morton wrote:

> On Mon, 26 Apr 2021 15:05:50 -0700 Junxiao Bi <junxiao.bi@oracle.com> wrote:
>
>> When doing truncate/fallocate for some filesytem like ocfs2, it
>> will zero some pages that are out of inode size and then later
>> update the inode size, so it needs this api to writeback eof
>> pages.
> Seems reasonable.  But can we please update the
> __block_write_full_page_eof() comment?  It now uses the wrong function
> name and doesn't document the new `eof' argument.

Jan suggested using sb_issue_zeroout to zero eof pages in 
ocfs2_fallocate, that can

also fix the issue for ocfs2. For gfs2, i though it had the same issue, 
but i didn't get

a confirm from gfs2 maintainer, if gfs2 is ok, then maybe this new api 
is not necessary?

Thanks,

Junxiao.

>

