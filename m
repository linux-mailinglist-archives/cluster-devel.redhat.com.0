Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 88E14371E8F
	for <lists+cluster-devel@lfdr.de>; Mon,  3 May 2021 19:27:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-vJKsmQw9NCKXoumsQEsW0Q-1; Mon, 03 May 2021 13:27:08 -0400
X-MC-Unique: vJKsmQw9NCKXoumsQEsW0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62B5681840C;
	Mon,  3 May 2021 17:27:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 314075D9DD;
	Mon,  3 May 2021 17:27:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD31655346;
	Mon,  3 May 2021 17:26:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 143HQrib014538 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 3 May 2021 13:26:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BDA257AED; Mon,  3 May 2021 17:26:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B746F5017B
	for <cluster-devel@redhat.com>; Mon,  3 May 2021 17:26:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 778EB80B91A
	for <cluster-devel@redhat.com>; Mon,  3 May 2021 17:26:49 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-582-bL5vL62NNECaMidyl640rA-1; Mon, 03 May 2021 13:26:45 -0400
X-MC-Unique: bL5vL62NNECaMidyl640rA-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	143HQ9Ea071104; Mon, 3 May 2021 17:26:38 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2120.oracle.com with ESMTP id 388xxmvcjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 May 2021 17:26:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	143HKCPS141725; Mon, 3 May 2021 17:26:38 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
	(mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by aserp3020.oracle.com with ESMTP id 388xt2qda1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 May 2021 17:26:38 +0000
Received: from SJ0PR10MB4752.namprd10.prod.outlook.com (2603:10b6:a03:2d7::19)
	by BYAPR10MB3125.namprd10.prod.outlook.com (2603:10b6:a03:14c::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41;
	Mon, 3 May 2021 17:26:36 +0000
Received: from SJ0PR10MB4752.namprd10.prod.outlook.com
	([fe80::7865:7d35:9cee:363f]) by
	SJ0PR10MB4752.namprd10.prod.outlook.com
	([fe80::7865:7d35:9cee:363f%5]) with mapi id 15.20.4087.044;
	Mon, 3 May 2021 17:26:36 +0000
To: Jan Kara <jack@suse.cz>
References: <20210426220552.45413-1-junxiao.bi@oracle.com>
	<CAHc6FU62TpZTnAYd3DWFNWWPZP-6z+9JrS82t+YnU-EtFrnU0Q@mail.gmail.com>
	<3f06d108-1b58-6473-35fa-0d6978e219b8@oracle.com>
	<20210430124756.GA5315@quack2.suse.cz>
	<a69fa4bc-ffe7-204b-6a1f-6a166c6971a4@oracle.com>
	<20210503102904.GC2994@quack2.suse.cz>
From: Junxiao Bi <junxiao.bi@oracle.com>
Message-ID: <72cde802-bd8a-9ce5-84d7-57b34a6a8b03@oracle.com>
Date: Mon, 3 May 2021 10:25:31 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.10.0
In-Reply-To: <20210503102904.GC2994@quack2.suse.cz>
X-Originating-IP: [73.231.9.254]
X-ClientProxiedBy: SN4PR0701CA0003.namprd07.prod.outlook.com
	(2603:10b6:803:28::13) To SJ0PR10MB4752.namprd10.prod.outlook.com
	(2603:10b6:a03:2d7::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dhcp-10-159-246-23.vpn.oracle.com (73.231.9.254) by
	SN4PR0701CA0003.namprd07.prod.outlook.com
	(2603:10b6:803:28::13) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
	id 15.20.4087.39 via Frontend Transport;
	Mon, 3 May 2021 17:26:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aee589d3-0d60-4e6a-d0ac-08d90e589a53
X-MS-TrafficTypeDiagnostic: BYAPR10MB3125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3125C336070CDBC3288124C3E85B9@BYAPR10MB3125.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: otju7OZLHVSHnqyu0Mxy4AzdniYOMoJRq0wWEMLcX6nqfdEQA02UH8WG5fupdVnGUArOQ8HgVIahvAg091NdwQkFFHi66KRXb3v5fZ9m/zaXNnP/lv/7f8eEWtBBSQNNX8ctvr1J+TS+8Y3gMtcIOAFdjLcEYpVJ+keVNurh00ObQFE7ySwP1NeODQHXRvjcJDNkjGTfZQpT0bCPKkhNnh9qtpNyEsLuPo2WngHmHP4V3JOQizjYjL0hpC6dEXjesoU7SuBqZzHm19aDcS1PNR7lf4WL2q2nsiNQxrdEQu2NGmISAng7YIhikZ/j7inliNCmunIlQGkXXrhewhdiendms4iO0SGNrpqpJtbkskxMmCxMZHUfQwZ82Juju2/9mE/kNrJO9Y0AIzWUwvTjL6AghakiGS2V/UcmHkNWQsFTrZR+qVZ7zXHMBM+tlgV3n0t+MrDYLG3rM/xLi6J9YN5D4Ex+olCpp4BM5WuxgnnUmrokFkeMuDME92FFXsROCwhT33FHgA39ygOnrylThqtzadaQeZ9Eju0nigWIxRUZfUbVw+MXw4aj7ZPp918BDjNrJuQo0S74nuwvTL9A1D/TpMELU0YM74jj92BPJq0BHIKUBllHWo5/qM2aH+KECNcIN1EK+vjqkzZdKvD6kPw6ROhaTHN92klyAJK8Ngfv0OtN2fi+/G5kSJiEz1QK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SJ0PR10MB4752.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(376002)(136003)(346002)(366004)(39860400002)(396003)(16526019)(6486002)(5660300002)(8676002)(38100700002)(186003)(316002)(44832011)(7696005)(66556008)(2616005)(956004)(86362001)(83380400001)(6916009)(53546011)(26005)(66946007)(6666004)(8936002)(54906003)(478600001)(31686004)(31696002)(36756003)(66476007)(4326008)(2906002)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VE1SZG5vZ3o3eDRPWEpVMklmTWp2QUJLVXNhbmVkR3ZQN25HeXduQW9kcG4y?=
	=?utf-8?B?ZFExYThZUVhZZE82TW1WK3dRc1JObS9HSTk3b0MzSDVnVDA4cUtaMzQydzQy?=
	=?utf-8?B?RXZDb0xnWVhDVUJOVnE3YkVPbVFNT3RYbFpEUDlob3hTV25adVhDQy9SYnNm?=
	=?utf-8?B?QVM5M0E1MTFjM2JFMHo1b084YzgwYktFcndJbUNjSXZ4ZldzRmRyRTFVYjVQ?=
	=?utf-8?B?WU1CZjVtc211cjNSM2RadjEyUjZ4ejJacHBFeU1YNy9DYy9YSEJ4Z05WZ1Nw?=
	=?utf-8?B?b0J1SkFKb0E4VGhXNit3Um5ldkUxRFh1NHBsaVpRMkVaMXI3TmhGa2ZrL0NX?=
	=?utf-8?B?ZmhyMmhNSUVoMGRCZFphc01kUkVIUGM3QmVNN291cGlVaHVQWVlzOXlmcnVD?=
	=?utf-8?B?ZVZGQjZoZGlPSDZsODFpZUc0dlhhcjJKdkE4OHhGS0lWbVZWVHo2ZGMwUUxr?=
	=?utf-8?B?NVVZQ1JJRndFR2J5RXBud0s2TDA5aUduT2tQOGpjbDZtMkdiVzkwQzcrWnFI?=
	=?utf-8?B?aS92SG5wZVJhTjZLb3NGdUdWVThsMEV5b21pWHZadnVtMVJ1TnRrR2hpaC9z?=
	=?utf-8?B?NVlkMTJFMTgreGdHaDgrNlJ0bXdRVG1sekx2MkNmdkJUYWQxYUVoczRmbmoz?=
	=?utf-8?B?RzdMRjNleW5wUGhoZ3Z6dzZJdXI2UTFmSzM5TUo1NHVIVHJDbnZjMnVQcXRE?=
	=?utf-8?B?dXlsZnZkMHFYZWtDSVBuY3JVcm9OdnByQmg0RVczNFhrUGx0MGltcjVvc2NG?=
	=?utf-8?B?NVZUYkNvc1FjeWM5UDk3YXhMUi9vYkw0T3VYeElzNHJiZzViWHdDeHpYYXZZ?=
	=?utf-8?B?c0E3bUkyUHhjam1uaGhoUEVUbCt2NklKOGhSRWRybm5yayswVEZhaDh5dTE4?=
	=?utf-8?B?NG5HYS9yN2tQLy9NOG5jdE1mdnY0Q0pkeUpYTjN6WmZjb3BQNUQzOWpxOW13?=
	=?utf-8?B?NERFRERvOEpqK0N3SDBWQS8vcmROUmJKSS9tMDYrQklEUm1MR0FVcThhalRX?=
	=?utf-8?B?SWFNYm84a0NidXUvM1lwRXg1MHNpdk83VWNiMXFTckJrbGJiQ3dKSjljYWtV?=
	=?utf-8?B?ZmFieGJwelc4VDBkb0plMmN2bXFiVkRNT0ZsWlAyVE5yRVdTVjdPRlZkZzNw?=
	=?utf-8?B?dlQyeFBJV1BrcXBtQVhmVHpEUFhRVHBiWktFbzY4UFZKb05RcXI5Nzh5R2E0?=
	=?utf-8?B?ZFZSY2kxWnJ3R3dITU85aFNyVFB3ZHpyc0tHQkdmNHdoUVprakJBdnpjV1cx?=
	=?utf-8?B?Kzc5VkhqQWxORndrbk9hZTJMS3ZDY01EYksrUGpYYTQvZHRhbUtLZVlEZGRE?=
	=?utf-8?B?Z1JNelU4UThxdEZ0cFpFSUdtdFI2MjdwSnJiZDJCSW4rYjd4c2xsVTFHaG5h?=
	=?utf-8?B?QXRaWTR2U1cvei9JU1YzWnVmKzBsY3Q4R0JsTm5WWkRRTWYzUGlibjBKbUV6?=
	=?utf-8?B?UXNKUFB6VDNteDE4c1pocDF0YW5EREVNa01ORDRLOThzTktSbnVyRHNhYWZr?=
	=?utf-8?B?QU40aUJ2SnU4SDNGVndiaHEyUjU2R2VvWGcvem5ZaGxDNDdENkJUNWtBdjNL?=
	=?utf-8?B?THZtWXB6Ynl4ZHVwK2htNFJ5bWFRMGVGNStwTFpBWjJ5OVJhUjk3VWwvTGZQ?=
	=?utf-8?B?U04wWWxNd2pBZ1h5Y0kwZ2tNNzZNWE5vZ1M4TFJKb1p3dFNsZmE1OGFGY3Yy?=
	=?utf-8?B?R3VPL0o5d1BFZDdOL0xHTktTZ1ZmZXVyeEczSU9BdHpDem8vWlNQMzUvbWg3?=
	=?utf-8?Q?KXk8MdGPzzRSetL4nUaDbbWwz+1yS/fbyhzqWHY?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee589d3-0d60-4e6a-d0ac-08d90e589a53
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4752.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 17:26:36.0254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IPnmU1lM/mJaPMVH7mEtmpDK8+GKFiOWu8S4lGZuPF505yWK5nndVmB9TD7GvtK2DNenzZB8D4i3TwJQyZsdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3125
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9973
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	mlxlogscore=999
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
	malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2104060000 definitions=main-2105030114
X-Proofpoint-GUID: xkdelSiEKmtGyNZoeNN7LwdRHxGgmfFr
X-Proofpoint-ORIG-GUID: xkdelSiEKmtGyNZoeNN7LwdRHxGgmfFr
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9973
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	spamscore=0
	suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
	mlxlogscore=999 priorityscore=1501 impostorscore=0 mlxscore=0
	adultscore=0
	bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2104060000 definitions=main-2105030114
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/3/21 3:29 AM, Jan Kara wrote:
> On Fri 30-04-21 14:18:15, Junxiao Bi wrote:
>> On 4/30/21 5:47 AM, Jan Kara wrote:
>>
>>> On Thu 29-04-21 11:07:15, Junxiao Bi wrote:
>>>> On 4/29/21 10:14 AM, Andreas Gruenbacher wrote:
>>>>> On Tue, Apr 27, 2021 at 4:44 AM Junxiao Bi <junxiao.bi@oracle.com> wrote:
>>>>>> When doing truncate/fallocate for some filesytem like ocfs2, it
>>>>>> will zero some pages that are out of inode size and then later
>>>>>> update the inode size, so it needs this api to writeback eof
>>>>>> pages.
>>>>> is this in reaction to Jan's "[PATCH 0/12 v4] fs: Hole punch vs page
>>>>> cache filling races" patch set [*]? It doesn't look like the kind of
>>>>> patch Christoph would be happy with.
>>>> Thank you for pointing the patch set. I think that is fixing a different
>>>> issue.
>>>>
>>>> The issue here is when extending file size with fallocate/truncate, if the
>>>> original inode size
>>>>
>>>> is in the middle of the last cluster block(1M), eof part will be zeroed with
>>>> buffer write first,
>>>>
>>>> and then new inode size is updated, so there is a window that dirty pages is
>>>> out of inode size,
>>>>
>>>> if writeback is kicked in, block_write_full_page will drop all those eof
>>>> pages.
>>> I agree that the buffers describing part of the cluster beyond i_size won't
>>> be written. But page cache will remain zeroed out so that is fine. So you
>>> only need to zero out the on disk contents. Since this is actually
>>> physically contiguous range of blocks why don't you just use
>>> sb_issue_zeroout() to zero out the tail of the cluster? It will be more
>>> efficient than going through the page cache and you also won't have to
>>> tweak block_write_full_page()...
>> Thanks for the review.
>>
>> The physical blocks to be zeroed were continuous only when sparse mode is
>> enabled, if sparse mode is disabled, unwritten extent was not supported for
>> ocfs2, then all the blocks to the new size will be zeroed by the buffer
>> write, since sb_issue_zeroout() will need waiting io done, there will be a
>> lot of delay when extending file size. Use writeback to flush async seemed
>> more efficient?
> It depends. Higher end storage (e.g. NVME or NAS, maybe some better SATA
> flash disks as well) do support WRITE_ZERO command so you don't actually
> have to write all those zeros. The storage will just internally mark all
> those blocks as having zeros. This is rather fast so I'd expect the overall
> result to be faster that zeroing page cache and then writing all those
> pages with zeroes on transaction commit. But I agree that for lower end
> storage this may be slower because of synchronous writing of zeroes. That
> being said your transaction commit has to write those zeroes anyway so the
> cost is only mostly shifted but it could still make a difference for some
> workloads. Not sure if that matters, that is your call I'd say.

Ocfs2 is mostly used with SAN, i don't think it's common for SAN storage 
to support WRITE_ZERO command.

Anything bad to add a new api to support eof writeback?

Thanks,

Junxiao.

>
> Also note that you could submit those zeroing bios asynchronously but that
> would be more coding and you need to make sure they are completed on
> transaction commit so probably it isn't worth the complexity.
>
> 								Honza

