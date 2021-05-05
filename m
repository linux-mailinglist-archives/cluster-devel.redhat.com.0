Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E4F0E373F0B
	for <lists+cluster-devel@lfdr.de>; Wed,  5 May 2021 17:56:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-tHRkF8-AOQ6oT5dsI99tOQ-1; Wed, 05 May 2021 11:56:19 -0400
X-MC-Unique: tHRkF8-AOQ6oT5dsI99tOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 199A880EDAD;
	Wed,  5 May 2021 15:56:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D93E5C5B5;
	Wed,  5 May 2021 15:56:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D2CE180B464;
	Wed,  5 May 2021 15:56:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 145Fu70k027811 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 5 May 2021 11:56:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0912810CD774; Wed,  5 May 2021 15:56:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01AA210CD773
	for <cluster-devel@redhat.com>; Wed,  5 May 2021 15:56:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2B7618E0920
	for <cluster-devel@redhat.com>; Wed,  5 May 2021 15:56:03 +0000 (UTC)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-131-Vwab0vkCPr-hNMJTv1WaEA-1; Wed, 05 May 2021 11:56:01 -0400
X-MC-Unique: Vwab0vkCPr-hNMJTv1WaEA-1
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	145FstCO196347; Wed, 5 May 2021 15:55:55 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2130.oracle.com with ESMTP id 38begjaa1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 May 2021 15:55:54 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	145FtHJ3175374; Wed, 5 May 2021 15:55:53 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
	(mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by userp3030.oracle.com with ESMTP id 38bebtph7q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 May 2021 15:55:53 +0000
Received: from SJ0PR10MB4752.namprd10.prod.outlook.com (2603:10b6:a03:2d7::19)
	by BY5PR10MB4002.namprd10.prod.outlook.com (2603:10b6:a03:1b0::31)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41;
	Wed, 5 May 2021 15:55:51 +0000
Received: from SJ0PR10MB4752.namprd10.prod.outlook.com
	([fe80::7865:7d35:9cee:363f]) by
	SJ0PR10MB4752.namprd10.prod.outlook.com
	([fe80::7865:7d35:9cee:363f%5]) with mapi id 15.20.4108.026;
	Wed, 5 May 2021 15:55:51 +0000
To: Jan Kara <jack@suse.cz>
References: <20210426220552.45413-1-junxiao.bi@oracle.com>
	<CAHc6FU62TpZTnAYd3DWFNWWPZP-6z+9JrS82t+YnU-EtFrnU0Q@mail.gmail.com>
	<3f06d108-1b58-6473-35fa-0d6978e219b8@oracle.com>
	<20210430124756.GA5315@quack2.suse.cz>
	<a69fa4bc-ffe7-204b-6a1f-6a166c6971a4@oracle.com>
	<20210503102904.GC2994@quack2.suse.cz>
	<72cde802-bd8a-9ce5-84d7-57b34a6a8b03@oracle.com>
	<20210504090237.GC1355@quack2.suse.cz>
	<84794fdb-fb49-acf1-4949-eef856737698@oracle.com>
	<20210505114341.GB29867@quack2.suse.cz>
From: Junxiao Bi <junxiao.bi@oracle.com>
Message-ID: <3c04ff88-0139-86f2-aafd-f294c48b7303@oracle.com>
Date: Wed, 5 May 2021 08:54:45 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.10.0
In-Reply-To: <20210505114341.GB29867@quack2.suse.cz>
X-Originating-IP: [73.231.9.254]
X-ClientProxiedBy: SN6PR08CA0034.namprd08.prod.outlook.com
	(2603:10b6:805:66::47) To SJ0PR10MB4752.namprd10.prod.outlook.com
	(2603:10b6:a03:2d7::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from dhcp-10-159-155-218.vpn.oracle.com (73.231.9.254) by
	SN6PR08CA0034.namprd08.prod.outlook.com (2603:10b6:805:66::47)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25
	via Frontend Transport; Wed, 5 May 2021 15:55:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eb1afb3-1c46-4c7d-442c-08d90fde41d8
X-MS-TrafficTypeDiagnostic: BY5PR10MB4002:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB40028B1CE1A4FE0DB328EC51E8599@BY5PR10MB4002.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: JnUndAzx2toXCoLXkFBDVLAi/g6bkYdk2EXk2iM2oWPZl39nbULZ6ld4unRoCh1U3MV/z0QH1rO9QzWGKqZ3BddVK9Y+B6zCXaueY0YzOMPIUCTN/VAyRuCUQPHo4L1kqVWaQWGMmojwI1PpY1AzB0c6ANgMdM2jGENObmgsqwmHTj8n3Ij6vSfknxFytnPxVB9CY5y+8c+rk5QDZSeKMxGXrlLBmk/w+1sjXKzFScEkbH4O1swcEetDzaCn5XKx/6vLQRljs2remrwQlBZ9VcT4XtDqf7uPz4Ti+Yiiq/dvzcOw44w0uymv/1lEqj8mKL/mT3z1vmrKh8ok5kZTUKnoMh4Yqbv5gZXRIUdEKPUYbNp2RIqIi1GDA5FRO/0HqIbKuGliCcQIDJp2EFUflayQZ2E8bfYZmCoT1pT0+wik6Nd58xkEyYNkCc+PAaNR05lLbL37DYBei1p6QY6cdVY4Ykpb9TL2PHra5CJQ2WzsKkvrfAJwa8Ybux3gX4S8tzRjPvRa9vxFkgIVoj4L3vTixmQCMEcUS3Um9uTVP8ubUL03mfCPlW56vR/1U+8zSPys9j+L+dvgQdMfYlv7zD5b/UVYhrK6PCiqIgbIWBs8b+JjQlUVr26T6HiHh4db71Ci6pbvlVAtoiFNlAX/vFdsolKQeuAy3aoj/0yGzXxzWe5TYIzor/NuFOSE31Zm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SJ0PR10MB4752.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(39860400002)(396003)(366004)(346002)(376002)(31696002)(6666004)(316002)(66476007)(66556008)(956004)(38100700002)(478600001)(6486002)(2616005)(83380400001)(66946007)(8676002)(36756003)(31686004)(44832011)(2906002)(53546011)(6916009)(186003)(8936002)(5660300002)(54906003)(16526019)(86362001)(4326008)(26005)(7696005)(43740500002)(45980500001);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?akVUN3gxR25uWUw0NVhiaGFYZkNNbWFPcVhxS000R3NWY3lObkV0V3dlalht?=
	=?utf-8?B?UVRKaVlvSURQNGJMdmJhOXFQREVtMnVDaE1wMW9PTFNubnY1NEhGM3M2M3lo?=
	=?utf-8?B?QzJtcnk0R2N6SlZvZEVOekdSQXZqQzR4SWtWaG8zdGhvRzcvbGtnN1NRci8y?=
	=?utf-8?B?ZmtQNWFxT0paTGJkUzl4NlBnRDZHcTgrcHdWSGtsRXcrSGQ4cEh0ZEtsTTdK?=
	=?utf-8?B?R3NwVGQzUG5LR0FMT3ZsOXlCazZRaUZtMVJBYUxZMHJMNitQbkFzdndrbFFG?=
	=?utf-8?B?Qm00a2JuQ24rUEdsRnN4STlUWFdxT0ZaT2JTS2h0ZzdjRHZlMlRWdGRmblF1?=
	=?utf-8?B?bFBDWnNETWJacVkwd0svY1AwL29ZY3FqQTBEajdnbHdLY1ZFUlE1ekRLdTVn?=
	=?utf-8?B?SHhIZWdMQ2N0QWlqSzBkaC8wdHhSZmNFRHpoYkJ6T2JYZEJwa2xycXlocmZU?=
	=?utf-8?B?RFpuZk9VVWV1SFV5ZG5wZUFVdFNmak9uUEtaYVNnV2RLRngxTDFvUnh1UXVL?=
	=?utf-8?B?cWd2QXNYNXVGMGFTcGJMTGlqS0dPN24rNTFxNFdHaDRoS25kalZrUXRJS3pZ?=
	=?utf-8?B?MWhQSTBiQWhxL2JTdzVKTE40U2o2ZXpMa0QvM0xXa1BjTDRyMHdNeDRBMjEy?=
	=?utf-8?B?bSs0aEVhZ3Z3L1NYdm9UcUphVmdNakExdUFrNU8vU3RkV2NHaUxHTDg0aEFS?=
	=?utf-8?B?OXpQdGw2M2RFbTJRRVhDTGdkK1h2dkMrOTRaQkdjKzZVa3RKb0E4d0xLcmov?=
	=?utf-8?B?ejdDWkxKc0FsbWdFcGdjaERpU2g5TmU3Z0hYcXk3QjlKVDhKWGZZck50bnpG?=
	=?utf-8?B?MXE0RXJzTExtQU1hQjR5eWExZ0VDQ2E5dlZFV3FjT2pZRGNMblVNZnAzOWhM?=
	=?utf-8?B?enE0K084WXpSY3dCMXlXNnpmRUJvOW1OSS81ZTRPTFBBTUtzOU1kYzNQZE1h?=
	=?utf-8?B?R3RVVWhQQmtza3FUcklIczk2RklsVDFuQXdhbG00ZjZNUUg3ZWpVZUhLOXNF?=
	=?utf-8?B?Q24zOUtGNm1yeVhNTlJEQVQ1ekZRdXlxb3VSTnhjV2QxMzQ4NVJaMXdsRDBy?=
	=?utf-8?B?U2FPcmNoMklxNExmcll2UE5uVnRhMy9xQy9wZ3ZYM29kdC9PU0tpSzliSzJn?=
	=?utf-8?B?SVZHVDl0dXhia3c2S0s4VS91UjhqZkhMVE5PVGlYa1Avb2NSa3ZHbCtnQ1ZD?=
	=?utf-8?B?VFZOQU1PWkhFT3RrRU9lbkg4UWFMaEhHWU1rVVZoNlZjcTZDQ0preDRCTjVk?=
	=?utf-8?B?UVNoWFllSFp5b25WVnVaWDRsVk1JQjcrUU1VNzlIVTZFdG50YXpqakhUSE56?=
	=?utf-8?B?ZHZqZjM3UnU5enZCazRUTE9hMWd5V2dNVGNpUTZIRktSTU4xRDZ6aW5oVW5t?=
	=?utf-8?B?UldKeFU4SmI4TVRyaGFmRmltUGpZL1Y3bFQxUnlxWDRDR2FtZzFpcTU3WHB3?=
	=?utf-8?B?U0lsWU5TYVdpSktMWDRnWWZPVStnZUlPUGdHVnNnRmlpTzdDSDNqY2c5Ynkv?=
	=?utf-8?B?NE1meXdVOXVqUVhsQmUwbG5hdzV6MFkrQVpoTjFBdUN4R2xDbDJQOXZlbWNR?=
	=?utf-8?B?TkovV2ZYclhzMXh0V3pTRHNsdysyQm9VczZMUHZMRUxjM2lZTEhuVnJQemJX?=
	=?utf-8?B?MnZMblcrWHBDeWM5a0k0anBwakU1bDE0SHdjR0NJOWZ2Tk9KQzJwZ3Z1eDZj?=
	=?utf-8?B?czFPbzFnbjJQVi9HTzNQSE1ybTZ4RU0zdXhTaDZjb21Ba2lpQlVScXBQRGIr?=
	=?utf-8?Q?EfZmDIrjkW88uAf7sfY5LiMEcYry/EmDu8ViSmj?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb1afb3-1c46-4c7d-442c-08d90fde41d8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4752.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 15:55:51.2559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7dfSIv+nuSTcFaNbgQCD7cS9lsrjYrusWcG49asCr01Y+T2DLBGrpj7NzGIsy9dEOrXvsJptC2B9CWPkf/BA3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4002
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9975
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	adultscore=0
	phishscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0
	mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2104060000 definitions=main-2105050113
X-Proofpoint-GUID: ApHlWhNRpIeE6hDMjH9XD9sfGZ12NrS6
X-Proofpoint-ORIG-GUID: ApHlWhNRpIeE6hDMjH9XD9sfGZ12NrS6
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9975
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
	malwarescore=0
	mlxlogscore=999 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
	impostorscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
	phishscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2104060000 definitions=main-2105050113
X-MIME-Autoconverted: from 8bit to quoted-printable by aserp2130.oracle.com id
	145FstCO196347
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 145Fu70k027811
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit


On 5/5/21 4:43 AM, Jan Kara wrote:
> On Tue 04-05-21 16:35:53, Junxiao Bi wrote:
>> On 5/4/21 2:02 AM, Jan Kara wrote:
>>> On Mon 03-05-21 10:25:31, Junxiao Bi wrote:
>>>> On 5/3/21 3:29 AM, Jan Kara wrote:
>>>>> On Fri 30-04-21 14:18:15, Junxiao Bi wrote:
>>>>>> On 4/30/21 5:47 AM, Jan Kara wrote:
>>>>>>
>>>>>>> On Thu 29-04-21 11:07:15, Junxiao Bi wrote:
>>>>>>>> On 4/29/21 10:14 AM, Andreas Gruenbacher wrote:
>>>>>>>>> On Tue, Apr 27, 2021 at 4:44 AM Junxiao Bi <junxiao.bi@oracle.com> wrote:
>>>>>>>>>> When doing truncate/fallocate for some filesytem like ocfs2, it
>>>>>>>>>> will zero some pages that are out of inode size and then later
>>>>>>>>>> update the inode size, so it needs this api to writeback eof
>>>>>>>>>> pages.
>>>>>>>>> is this in reaction to Jan's "[PATCH 0/12 v4] fs: Hole punch vs page
>>>>>>>>> cache filling races" patch set [*]? It doesn't look like the kind of
>>>>>>>>> patch Christoph would be happy with.
>>>>>>>> Thank you for pointing the patch set. I think that is fixing a different
>>>>>>>> issue.
>>>>>>>>
>>>>>>>> The issue here is when extending file size with fallocate/truncate, if the
>>>>>>>> original inode size
>>>>>>>>
>>>>>>>> is in the middle of the last cluster block(1M), eof part will be zeroed with
>>>>>>>> buffer write first,
>>>>>>>>
>>>>>>>> and then new inode size is updated, so there is a window that dirty pages is
>>>>>>>> out of inode size,
>>>>>>>>
>>>>>>>> if writeback is kicked in, block_write_full_page will drop all those eof
>>>>>>>> pages.
>>>>>>> I agree that the buffers describing part of the cluster beyond i_size won't
>>>>>>> be written. But page cache will remain zeroed out so that is fine. So you
>>>>>>> only need to zero out the on disk contents. Since this is actually
>>>>>>> physically contiguous range of blocks why don't you just use
>>>>>>> sb_issue_zeroout() to zero out the tail of the cluster? It will be more
>>>>>>> efficient than going through the page cache and you also won't have to
>>>>>>> tweak block_write_full_page()...
>>>>>> Thanks for the review.
>>>>>>
>>>>>> The physical blocks to be zeroed were continuous only when sparse mode is
>>>>>> enabled, if sparse mode is disabled, unwritten extent was not supported for
>>>>>> ocfs2, then all the blocks to the new size will be zeroed by the buffer
>>>>>> write, since sb_issue_zeroout() will need waiting io done, there will be a
>>>>>> lot of delay when extending file size. Use writeback to flush async seemed
>>>>>> more efficient?
>>>>> It depends. Higher end storage (e.g. NVME or NAS, maybe some better SATA
>>>>> flash disks as well) do support WRITE_ZERO command so you don't actually
>>>>> have to write all those zeros. The storage will just internally mark all
>>>>> those blocks as having zeros. This is rather fast so I'd expect the overall
>>>>> result to be faster that zeroing page cache and then writing all those
>>>>> pages with zeroes on transaction commit. But I agree that for lower end
>>>>> storage this may be slower because of synchronous writing of zeroes. That
>>>>> being said your transaction commit has to write those zeroes anyway so the
>>>>> cost is only mostly shifted but it could still make a difference for some
>>>>> workloads. Not sure if that matters, that is your call I'd say.
>>>> Ocfs2 is mostly used with SAN, i don't think it's common for SAN storage to
>>>> support WRITE_ZERO command.
>>>>
>>>> Anything bad to add a new api to support eof writeback?
>>> OK, now that I reread the whole series you've posted I think I somewhat
>>> misunderstood your original problem and intention. So let's first settle
>>> on that. As far as I understand the problem happens when extending a file
>>> (either through truncate or through write beyond i_size). When that
>>> happens, we need to make sure that blocks (or their parts) that used to be
>>> above i_size and are not going to be after extension are zeroed out.
>>> Usually, for simple filesystems such as ext2, there is only one such block
>>> - the one straddling i_size - where we need to make sure this happens. And
>>> we achieve that by zeroing out tail of this block on writeout (in
>>> ->writepage() handler) and also by zeroing out tail of the block when
>>> reducing i_size (block_truncate_page() takes care of this for ext2). So the
>>> tail of this block is zeroed out on disk at all times and thus we have no
>>> problem when extending i_size.
>>>
>>> Now what I described doesn't work for OCFS2. As far as I understand the
>>> reason is that when block size is smaller than page size and OCFS2 uses
>>> cluster size larger than block size, the page straddling i_size can have
>>> also some buffers mapped (with underlying blocks allocated) that are fully
>>> outside of i_size. These blocks are never written because of how
>>> __block_write_full_page() currently behaves (never writes buffers fully
>>> beyond i_size) so even if you zero out page cache and dirty the page,
>>> racing writeback can clear dirty bits without writing those blocks and so
>>> they are not zeroed out on disk although we are about to expand i_size.
>> Correct.
>>> Did I understand the problem correctly? But what confuses me is that
>>> ocfs2_zero_extend_range() (ocfs2_write_zero_page() in fact) actually does
>>> extend i_size to contain the range it zeroes out while still holding the
>>> page lock so it should be protected against the race with writeback I
>>> outlined above. What am I missing?
>> Thank you for pointing this. I didn't realize ocfs2_zero_extend() will
>> update inode size,
>>
>> with it, truncate to extend file will not suffer this issue. The original
>> issue happened with
>>
>> qemu that used the following fallocate to extend file size. The first
>> fallocate punched
>>
>> hole beyond the inode size(2276196352) but not update isize, the second one
>> updated
>>
>> isize, the first one will do some buffer write to zero eof blocks in
>> ocfs2_remove_inode_range
>>
>> ->ocfs2_zero_partial_clusters->ocfs2_zero_range_for_truncate.
>>
>>      fallocate(11, FALLOC_FL_KEEP_SIZE|FALLOC_FL_PUNCH_HOLE, 2276196352,
>> 65536) = 0
>>      fallocate(11, 0, 2276196352, 65536) = 0
> OK, I see. And AFAICT it is not about writeback racing with the zeroing in
> ocfs2_zero_range_for_truncate() but rather the filemap_fdatawrite_range()
> there not writing out zeroed pages if they are beyond i_size. And honestly,
> rather than trying to extend block_write_full_page() for this odd corner
> case, I'd use sb_issue_zeroout() or code something similar to
> __blkdev_issue_zero_pages() inside OCFS2. Because making pages in the page
> cache beyond i_size work is always going to be fragile...

Thanks for the suggestion. I will make v2 using zeroout.

Thanks,

Junxiao.

>
> 								Honza


