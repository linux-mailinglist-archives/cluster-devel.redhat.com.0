Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9719D3732C8
	for <lists+cluster-devel@lfdr.de>; Wed,  5 May 2021 01:37:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-jpuYFEDuMs2BOP78sJEFAw-1; Tue, 04 May 2021 19:37:29 -0400
X-MC-Unique: jpuYFEDuMs2BOP78sJEFAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD6F079EC0;
	Tue,  4 May 2021 23:37:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4832760C17;
	Tue,  4 May 2021 23:37:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E9E655352;
	Tue,  4 May 2021 23:37:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 144NbISL002494 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 4 May 2021 19:37:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EB1EC20B6657; Tue,  4 May 2021 23:37:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E426320B665A
	for <cluster-devel@redhat.com>; Tue,  4 May 2021 23:37:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CECBB80A0B0
	for <cluster-devel@redhat.com>; Tue,  4 May 2021 23:37:14 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-273-cGyS0YdFNmGlQ6f3sms5sQ-1; Tue, 04 May 2021 19:37:10 -0400
X-MC-Unique: cGyS0YdFNmGlQ6f3sms5sQ-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	144NYNBk186762; Tue, 4 May 2021 23:37:03 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2120.oracle.com with ESMTP id 38bemjg4dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 May 2021 23:37:03 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	144NVPs9017800; Tue, 4 May 2021 23:37:02 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
	(mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by userp3020.oracle.com with ESMTP id 38bfur8cx5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 May 2021 23:37:02 +0000
Received: from SJ0PR10MB4752.namprd10.prod.outlook.com (2603:10b6:a03:2d7::19)
	by SJ0PR10MB4797.namprd10.prod.outlook.com (2603:10b6:a03:2d8::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.40;
	Tue, 4 May 2021 23:36:59 +0000
Received: from SJ0PR10MB4752.namprd10.prod.outlook.com
	([fe80::7865:7d35:9cee:363f]) by
	SJ0PR10MB4752.namprd10.prod.outlook.com
	([fe80::7865:7d35:9cee:363f%5]) with mapi id 15.20.4087.044;
	Tue, 4 May 2021 23:36:59 +0000
To: Jan Kara <jack@suse.cz>
References: <20210426220552.45413-1-junxiao.bi@oracle.com>
	<CAHc6FU62TpZTnAYd3DWFNWWPZP-6z+9JrS82t+YnU-EtFrnU0Q@mail.gmail.com>
	<3f06d108-1b58-6473-35fa-0d6978e219b8@oracle.com>
	<20210430124756.GA5315@quack2.suse.cz>
	<a69fa4bc-ffe7-204b-6a1f-6a166c6971a4@oracle.com>
	<20210503102904.GC2994@quack2.suse.cz>
	<72cde802-bd8a-9ce5-84d7-57b34a6a8b03@oracle.com>
	<20210504090237.GC1355@quack2.suse.cz>
From: Junxiao Bi <junxiao.bi@oracle.com>
Message-ID: <84794fdb-fb49-acf1-4949-eef856737698@oracle.com>
Date: Tue, 4 May 2021 16:35:53 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.10.0
In-Reply-To: <20210504090237.GC1355@quack2.suse.cz>
X-Originating-IP: [73.231.9.254]
X-ClientProxiedBy: SA0PR11CA0043.namprd11.prod.outlook.com
	(2603:10b6:806:d0::18) To SJ0PR10MB4752.namprd10.prod.outlook.com
	(2603:10b6:a03:2d7::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dhcp-10-159-159-147.vpn.oracle.com (73.231.9.254) by
	SA0PR11CA0043.namprd11.prod.outlook.com (2603:10b6:806:d0::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25
	via Frontend Transport; Tue, 4 May 2021 23:36:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e19eb24-e745-4071-7ec1-08d90f5582c6
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47974275DFFAC7A6B2021FB5E85A9@SJ0PR10MB4797.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: MIGWrBvHoNTpHlq2A9OE8SRtVzgb7/fMsGr49WTLCHKS6RHuQFsN3/UBWPFofWGuIBtX07F/XIH0y6qEkbWD9kXjEg98vIWc2DYHJ53biRN5vqM5fn9hUgTOGww6pVI2+pK+hJtBIS/AU/J+1+QRe5Oc089T8Hl2JQKxYYA0Yy9hoIkfpcg/NUw49blmfF8nWeBUmmfYYjHp66QWUYB8SWtBACyE8dq68zyv39nRi+qQIcCY3sg98FDQ/Pf9UvXHGr27rYPkFmRrx7UxXGHaZuNtpCHsqi3eUp9yoXVpKUq5inwUbQdyN/QtIjTw3gkglfN8SyYrO0qfHEFACZ51NqrMyHDXcASG/j1WQmT1z7qh2Vnjav/T6Yd5EO14gkDHaAkcFJnuA6jbExv9Or9Ochmm/FlC1K+++ub/QmhDnTD8+FrJcmJIy+mhD6kE/KHe+6JeurJ+HyVm7B5SS/5MK+0R92t34BfYfvgydSIEywfTEQEiHe0iBA+8T2krXQ2dT/Mj8so++S1+Ta0BU4+gWBDgnlNFdbcaJ7Djomd5/MSZ8ZXw+BKl4UYrerWJq/YmpIoRsT2LtWmMU1ZQHsFIIZHXeLl5Xh2fNLeT1M+cMB8/C1l+EcRjeQRxAG39ITBMN/3l6c6jJuZe91khLZfdL8gXEKC00+aSCDooOSGyI69dA/BQ1hVIXN6f2FBiMGO3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SJ0PR10MB4752.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(396003)(136003)(346002)(39860400002)(366004)(376002)(53546011)(478600001)(38100700002)(6486002)(7696005)(8676002)(36756003)(86362001)(2906002)(31686004)(6666004)(26005)(8936002)(66946007)(4326008)(31696002)(316002)(44832011)(2616005)(66556008)(186003)(5660300002)(66476007)(54906003)(83380400001)(6916009)(16526019)(956004)(43740500002)(45980500001);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RWo0ajk1a0ZJaUlHcWVQVktTaVlHNkhQN0NYWnRJb2RMUU50bEpPZ0dlcUIr?=
	=?utf-8?B?QS9LSW5WaElHeUZtQithRVFBcGpMcEVEaDVmTTJVZThIVjRHZ0IydXlVcTVC?=
	=?utf-8?B?QnhDRE1tZFFDKzZ1dklLd1hlQmhGWlI1RUJuZnBhdzZSdXpNbTl4a05sZlpB?=
	=?utf-8?B?R0VsSjdpZ2x0R0ZyL3ZDWkNYSEl1dVVKODA1b0lIcnc4NXQvQ3VoVEJONEM3?=
	=?utf-8?B?aTE0UlVockdybmdGa29HZHVOUUpFTkpxVTJuYXBDRTFtQTErZFZVQmY5WVJE?=
	=?utf-8?B?WGZ3cy9zUEx6MUdGeVgvU3dSRHV6VEJWVUdLSHFLb0t0WWFLRk5pNlBvelpG?=
	=?utf-8?B?ZmM0dmpRRUNtZmRiRnI2a21pRGhrblhTUEF5SHQ4L3l2WEZNTlV0b1N0c2lI?=
	=?utf-8?B?UUFqVTNRajQybHA3Mm9obEI3U3VDQUlSZkdRallkRGJLVUJyNGtsdnhQOXc3?=
	=?utf-8?B?WkJUV05nSHd5SmNWajNnV3VJTzN6WWNNWEZ3V2srWjlWclhYQk9IR21xd09u?=
	=?utf-8?B?bDJHWDB0Y01WRTRsZmRQeWc4eGphZ2pENUtISVBma0JwQlBHck5mRjNxVWda?=
	=?utf-8?B?MWE2c1lxZUVSMG9uNm1RelExN1d0UWYzYVo0Z21UZ3pWM21veDh2Rmw4bXM5?=
	=?utf-8?B?OFp5NENUM3BkUjZlN24raWpwakZ4aUtDUlRDbEpxOWg1VURUWkV1bE5SR3Fi?=
	=?utf-8?B?ZmE1dzIvVW16U3Yrc1c0MVc3bnkwUGFjSDFjcDlBUG84cndxMmNhY0xYTmlt?=
	=?utf-8?B?T2FiYTZ1VTU0U1FNeEwwM1RwcUVvU3pEWXZOblNuNURTNmlaVmpadDFJT1pW?=
	=?utf-8?B?b1ZFVW93NEJjQ3ZMa0NvMkthVlRYL1pIaDhqWVhDZFZJM1g4RjhWR1NPNXBS?=
	=?utf-8?B?QWpDTkU1RXRJRzByNDBEU0xwemFzMnRFWWpoT0dNMTZNNmx5UzVxOVlFRzhV?=
	=?utf-8?B?bFdpN3kreW5vdDlMUE5YVCs2UllZMElxdTF2VDRnbGRQMEIwczBqYjhPN243?=
	=?utf-8?B?TlR6MjJZNmQ2ZGxxL1d6NHNrZmc3UDJtWmdvSFRneEg5N2FmeUw2R0xBNDJS?=
	=?utf-8?B?OWxIVElqRGU2OC9OYWtRVE1VY2Fqc0FwOE1zVkJLWUpyYlhxQjhOVFZNcEp1?=
	=?utf-8?B?MG5zSmgrM1pLM3RlWGVXcEd3Z0pCSlIrVWRNSjVkckcyQXpBeFhVYjVwWnRW?=
	=?utf-8?B?ZDQ0Y0tvWktoVWlSbWxvUitVNmRjZW84N21KV1V6ZmZhRnA2MWt0dkM2SzZs?=
	=?utf-8?B?eE9MTFowRHYxeEE1L0pVejNacDNMOVc3ZzF1bVEzQVM0M2cwVWo1cGY3RjVH?=
	=?utf-8?B?QXRIOXQ2RTVJVE9IUGFhMWZJSGFwN1NhVmphZCs2M2FxUmZvSU9Lc0hScWF6?=
	=?utf-8?B?N2ZUNmYreFE5UERUTkUyMERVY3dqcUtDeGVVQ1dMWldtOG5BcWl0SjJlV2F6?=
	=?utf-8?B?Z1I2VlcrSDJEc3hPTFRVUldlQWpPMnhRYVhhcUlnRENoVjMyRFdNV3Rjbm53?=
	=?utf-8?B?TVZVdmt1ZHVBYnFXZGJLREN4NElSWE5uSWVnZW5CMTdXTjVUN0RUekllU1Ay?=
	=?utf-8?B?ZFZvYklLcXk4KytkNmFEdU04TFNwQnpqWUt6NnprcTZuMVFZRzlMSXhYb0xa?=
	=?utf-8?B?clp5SkhYY2ZnQjRzRXFlOGMzYldqc1FvVmswMHAra0NIbWxHcTRVZ0JZWGVt?=
	=?utf-8?B?aldUSjd0YmZCZGdBZVVwbGpDRW9YMnFZczBucUJmb3ZKMk5SM0dPYjl1K0JQ?=
	=?utf-8?Q?SESAhf2eji1/5HZMU7JM57EH/iR6vmqa6X8QdRJ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e19eb24-e745-4071-7ec1-08d90f5582c6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4752.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 23:36:59.1743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjAjKZkI3YQ4qEgR+6GIYNEr8O5TlkP3kfGk0Zu6ihGBa4slVc+ix6XDNkBSBa6F0WhmrkkBwrCKkIlAGMuxHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4797
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9974
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
	phishscore=0 mlxscore=0
	adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2104060000 definitions=main-2105040161
X-Proofpoint-ORIG-GUID: 9dIIFB7VQv7gcaliABItYDlvhw2Q3PjG
X-Proofpoint-GUID: 9dIIFB7VQv7gcaliABItYDlvhw2Q3PjG
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9974
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	lowpriorityscore=0 adultscore=0
	phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
	mlxlogscore=999 malwarescore=0 suspectscore=0 mlxscore=0 clxscore=1015
	bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2104060000 definitions=main-2105040161
X-MIME-Autoconverted: from 8bit to quoted-printable by aserp2120.oracle.com id
	144NYNBk186762
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 144NbISL002494
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	ocfs2-devel@oss.oracle.com, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH 1/3] fs/buffer.c: add new api to allow
 eof writeback
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 5/4/21 2:02 AM, Jan Kara wrote:

> On Mon 03-05-21 10:25:31, Junxiao Bi wrote:
>> On 5/3/21 3:29 AM, Jan Kara wrote:
>>> On Fri 30-04-21 14:18:15, Junxiao Bi wrote:
>>>> On 4/30/21 5:47 AM, Jan Kara wrote:
>>>>
>>>>> On Thu 29-04-21 11:07:15, Junxiao Bi wrote:
>>>>>> On 4/29/21 10:14 AM, Andreas Gruenbacher wrote:
>>>>>>> On Tue, Apr 27, 2021 at 4:44 AM Junxiao Bi <junxiao.bi@oracle.com> wrote:
>>>>>>>> When doing truncate/fallocate for some filesytem like ocfs2, it
>>>>>>>> will zero some pages that are out of inode size and then later
>>>>>>>> update the inode size, so it needs this api to writeback eof
>>>>>>>> pages.
>>>>>>> is this in reaction to Jan's "[PATCH 0/12 v4] fs: Hole punch vs page
>>>>>>> cache filling races" patch set [*]? It doesn't look like the kind of
>>>>>>> patch Christoph would be happy with.
>>>>>> Thank you for pointing the patch set. I think that is fixing a different
>>>>>> issue.
>>>>>>
>>>>>> The issue here is when extending file size with fallocate/truncate, if the
>>>>>> original inode size
>>>>>>
>>>>>> is in the middle of the last cluster block(1M), eof part will be zeroed with
>>>>>> buffer write first,
>>>>>>
>>>>>> and then new inode size is updated, so there is a window that dirty pages is
>>>>>> out of inode size,
>>>>>>
>>>>>> if writeback is kicked in, block_write_full_page will drop all those eof
>>>>>> pages.
>>>>> I agree that the buffers describing part of the cluster beyond i_size won't
>>>>> be written. But page cache will remain zeroed out so that is fine. So you
>>>>> only need to zero out the on disk contents. Since this is actually
>>>>> physically contiguous range of blocks why don't you just use
>>>>> sb_issue_zeroout() to zero out the tail of the cluster? It will be more
>>>>> efficient than going through the page cache and you also won't have to
>>>>> tweak block_write_full_page()...
>>>> Thanks for the review.
>>>>
>>>> The physical blocks to be zeroed were continuous only when sparse mode is
>>>> enabled, if sparse mode is disabled, unwritten extent was not supported for
>>>> ocfs2, then all the blocks to the new size will be zeroed by the buffer
>>>> write, since sb_issue_zeroout() will need waiting io done, there will be a
>>>> lot of delay when extending file size. Use writeback to flush async seemed
>>>> more efficient?
>>> It depends. Higher end storage (e.g. NVME or NAS, maybe some better SATA
>>> flash disks as well) do support WRITE_ZERO command so you don't actually
>>> have to write all those zeros. The storage will just internally mark all
>>> those blocks as having zeros. This is rather fast so I'd expect the overall
>>> result to be faster that zeroing page cache and then writing all those
>>> pages with zeroes on transaction commit. But I agree that for lower end
>>> storage this may be slower because of synchronous writing of zeroes. That
>>> being said your transaction commit has to write those zeroes anyway so the
>>> cost is only mostly shifted but it could still make a difference for some
>>> workloads. Not sure if that matters, that is your call I'd say.
>> Ocfs2 is mostly used with SAN, i don't think it's common for SAN storage to
>> support WRITE_ZERO command.
>>
>> Anything bad to add a new api to support eof writeback?
> OK, now that I reread the whole series you've posted I think I somewhat
> misunderstood your original problem and intention. So let's first settle
> on that. As far as I understand the problem happens when extending a file
> (either through truncate or through write beyond i_size). When that
> happens, we need to make sure that blocks (or their parts) that used to be
> above i_size and are not going to be after extension are zeroed out.
> Usually, for simple filesystems such as ext2, there is only one such block
> - the one straddling i_size - where we need to make sure this happens. And
> we achieve that by zeroing out tail of this block on writeout (in
> ->writepage() handler) and also by zeroing out tail of the block when
> reducing i_size (block_truncate_page() takes care of this for ext2). So the
> tail of this block is zeroed out on disk at all times and thus we have no
> problem when extending i_size.
>
> Now what I described doesn't work for OCFS2. As far as I understand the
> reason is that when block size is smaller than page size and OCFS2 uses
> cluster size larger than block size, the page straddling i_size can have
> also some buffers mapped (with underlying blocks allocated) that are fully
> outside of i_size. These blocks are never written because of how
> __block_write_full_page() currently behaves (never writes buffers fully
> beyond i_size) so even if you zero out page cache and dirty the page,
> racing writeback can clear dirty bits without writing those blocks and so
> they are not zeroed out on disk although we are about to expand i_size.
Correct.
>
> Did I understand the problem correctly? But what confuses me is that
> ocfs2_zero_extend_range() (ocfs2_write_zero_page() in fact) actually does
> extend i_size to contain the range it zeroes out while still holding the
> page lock so it should be protected against the race with writeback I
> outlined above. What am I missing?

Thank you for pointing this. I didn't realize ocfs2_zero_extend() will 
update inode size,

with it, truncate to extend file will not suffer this issue. The 
original issue happened with

qemu that used the following fallocate to extend file size. The first 
fallocate punched

hole beyond the inode size(2276196352) but not update isize, the second 
one updated

isize, the first one will do some buffer write to zero eof blocks in 
ocfs2_remove_inode_range

->ocfs2_zero_partial_clusters->ocfs2_zero_range_for_truncate.

     fallocate(11, FALLOC_FL_KEEP_SIZE|FALLOC_FL_PUNCH_HOLE, 2276196352, 
65536) = 0
     fallocate(11, 0, 2276196352, 65536) = 0


Thanks,

Junxiao.

>
> 								Honza


