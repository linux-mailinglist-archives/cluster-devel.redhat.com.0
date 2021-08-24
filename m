Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D3AA03F57A3
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Aug 2021 07:36:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-QiuX2VEWPRSNyT0XyWwgdA-1; Tue, 24 Aug 2021 01:36:40 -0400
X-MC-Unique: QiuX2VEWPRSNyT0XyWwgdA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E13A51008069;
	Tue, 24 Aug 2021 05:36:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9DF829403;
	Tue, 24 Aug 2021 05:36:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D95CD4BB7C;
	Tue, 24 Aug 2021 05:36:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17O5aOOI023572 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Aug 2021 01:36:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 720332029F6D; Tue, 24 Aug 2021 05:36:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C688201B079
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 05:36:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A4208007B1
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 05:36:21 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-129-P7DfVKKQMVGvB96gZ75ltw-1;
	Tue, 24 Aug 2021 01:36:17 -0400
X-MC-Unique: P7DfVKKQMVGvB96gZ75ltw-1
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-22-QJyDCk4iOI2yKsiqhrBBpQ-1; Tue, 24 Aug 2021 07:36:15 +0200
X-MC-Unique: QJyDCk4iOI2yKsiqhrBBpQ-1
Received: from AM6PR04MB6488.eurprd04.prod.outlook.com (2603:10a6:20b:f8::21)
	by AM5PR0402MB2708.eurprd04.prod.outlook.com (2603:10a6:203:99::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22;
	Tue, 24 Aug 2021 05:36:14 +0000
Received: from AM6PR04MB6488.eurprd04.prod.outlook.com
	([fe80::793c:6276:4f2a:4d71]) by
	AM6PR04MB6488.eurprd04.prod.outlook.com
	([fe80::793c:6276:4f2a:4d71%4]) with mapi id 15.20.4457.017;
	Tue, 24 Aug 2021 05:36:13 +0000
To: Alexander Aring <aahringo@redhat.com>
References: <AM6PR04MB64883088DB106BD3BC49B216CFC49@AM6PR04MB6488.eurprd04.prod.outlook.com>
	<CAK-6q+jtpogQirTu86nR=pBrAZtaP6b5ouY275GuvXYq0K-1YA@mail.gmail.com>
From: Gang He <ghe@suse.com>
Message-ID: <69e3b252-7929-9f4b-7ff4-eef47374e0c1@suse.com>
Date: Tue, 24 Aug 2021 13:36:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.13.0
In-Reply-To: <CAK-6q+jtpogQirTu86nR=pBrAZtaP6b5ouY275GuvXYq0K-1YA@mail.gmail.com>
X-ClientProxiedBy: HK0PR01CA0054.apcprd01.prod.exchangelabs.com
	(2603:1096:203:a6::18) To AM6PR04MB6488.eurprd04.prod.outlook.com
	(2603:10a6:20b:f8::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.67.20.87] (60.251.47.115) by
	HK0PR01CA0054.apcprd01.prod.exchangelabs.com
	(2603:1096:203:a6::18) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
	id 15.20.4436.19 via Frontend Transport;
	Tue, 24 Aug 2021 05:36:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 860cceee-49a5-494c-1a4e-08d966c11625
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2708:
X-Microsoft-Antispam-PRVS: <AM5PR0402MB270896E97A4FD63CF618376BCFC59@AM5PR0402MB2708.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: RlhLHZ8h5eiJqeufECzX29sDB+CI6ufC63r6aU/GH1CdLRI7veslQ+2k3Roj7Vr6kX9xLkCE2orzgJaMztdyNFKZtk+cUY9yRTXtrJTKGxJbo9VYzLqhhlRJFW/lAKxKm8zIvsqjes2bahwJ5kBG2T6EVUepuq/KxypGos56JHbnDg2BxBU4XA5ZJlrjUKUyHyws7IVDZdjH50nQgjclFQJPTwj5T3LUU2Oo+coswCfXyOH51mKf81lBaMfy+4fFFAz/rRRa8Ib5P2zqkuhUwFLFJyuuGGvo02qChoILQlprB1aExRJAnmdozNWkiaf4oRZZfChk2u1zb3yY3R/BDE0QNXzMO2+nXeHABWOWime0KqrUpx0uzRH4PrBa+t70Xe+YHTmSzy4PiYOdbWjZfa3MfOnbJZzm7BdQZHSDhQ60AVz86F8t6b6LHpgntheabE9KxpzBPF4dYIiTvwhP4ECRNqkuSpmxF2pMoNr3LQ4ng9AHq3E0Wba7Atp4W5LtPlqFP4In7xWgwuV2hKCaAlnerTyUkY12c667386FPYBX536qwoSO/0dbv9NY2YVLPjRuZwXmpXesoyvTVvNgTckX1Zwqro1way9PmUlP55g3V+PcILoNqfh1UqHj+WUWOZsFoQUgs1AosddZhNPDjsxcvBR7oWMr3XnYV5OBLBulbHOfUa65O9LNFkkr0N8hFVA1uzTKRnOzd7N2/vwe5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:AM6PR04MB6488.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(8676002)(66556008)(66476007)(6666004)(66946007)(5660300002)(36756003)(31686004)(6916009)(6486002)(8936002)(38100700002)(316002)(16576012)(508600001)(31696002)(55236004)(186003)(26005)(86362001)(2906002)(956004)(2616005)(450100002)(4326008)(53546011)(83380400001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHRVei8xZWlJblpTaFhvb2l3U0F0Zk12KzN6WldUQnVVcm15a0hFQk1DK2VE?=
	=?utf-8?B?U3VrV3FSdXdJR1RhVlFPY3MwVnBuNWxGdmRXSzBrUjlIcnJ1amZDMG1yVmgz?=
	=?utf-8?B?SERVWE1GdnJWZVVxcEpVZVc0Ry90SGRNSFBQR0NxQkNldWFieDBXWjcrTjM5?=
	=?utf-8?B?SkFtOUV5SXI0U0x3RG1OL215LzdvT1o5Y2hwSlE0TTNIQjdNY1FaN0d2Rlhp?=
	=?utf-8?B?Skl2QXdxQlkrd1VRMktJR3RzSkpPNmI3RGxsbjVBNWRldXBBeEtxRi9IaVFI?=
	=?utf-8?B?Uk91clp1S1RuU1UwZnl0YngxOG5lUWJaejdrWE5DNllzazhHbXhYRHJodU9Y?=
	=?utf-8?B?Rmt3bkJHRHB0N05xZmxncDFWQkVRVDVkck1XYmd6bkhzM00xcU5PcFRZL1Vo?=
	=?utf-8?B?UHNnUHFkYVVvSlZnSkFkaVpVTzF2UkFET0hwR3k4WmJ2RzZCNUNFMWRHc2Vh?=
	=?utf-8?B?cTVkWVVVMlhWeUFQcDFOajVzc2l0Rk85UjAvd21odXFEdkV2YTJ2bURFcTd1?=
	=?utf-8?B?a0QwbWF4ZkpaaW12aGtnTlZEZVliSjlPeEU3MFVYYjRJUSt6eStZZ25HL3BX?=
	=?utf-8?B?V3pYZmdLSjFrZHQwWlZxMnlFWE5PekVmWHZTMFpxOWtYYjlmTDQ4QnV0SnJG?=
	=?utf-8?B?YkJ1SlpnWkpmTTNEYUNWQmwrSnBhRjJtVzhUMUJxZG1DWnFLSFJJNG1NTnp0?=
	=?utf-8?B?c1UyTU5yUUxVUXhibllCRWRhK21NWTlPQ2pwYkhZcnZwaHppVDREblFpNVpB?=
	=?utf-8?B?YXFxTkJiRVBmbkpCcHdLRDNpb29JMjBUZFlxd0pEU1ZpclVCRzB2UnZ5UktI?=
	=?utf-8?B?VEFBRGQyK2JmZmVuTVJRZzVhOFUvaHZFNmJ1NDVkeWRRRTJ5aG1VTjZOZjlh?=
	=?utf-8?B?OGNkdVBsSkM2WkVhU2VFbyt3V2xUL29CK1IxS2dNMzNVTGxxN3dDdEFWT0Jq?=
	=?utf-8?B?bUg2Q3ZoYmgvSFAxbXVCZG5wQnd0VHU3cFhIc1Z1Mnk1L3hvY1VuVzUvZTdI?=
	=?utf-8?B?c2hJYkd1QmU4dUFhRmY5Q2J5WUZOTjg0MjI1K0hobWl1RGowWjl4YTNSZXdL?=
	=?utf-8?B?Q01zYm1FekpWOHpUL3h5cXB3eTQ5ck5IZk1pbkgrK2QyMit6dlo4bWJLc2dG?=
	=?utf-8?B?K1NNZy9OV1RVcmd1WjVhd2JEdzkrZkRieHE1aGxWZU0zQk5EbVloMlFqYTk5?=
	=?utf-8?B?VitYUGUxdzMraTFKRFdjYkRGeEJ3aU1jQXg0cVo4VnN6eFpITU11MzREMDZH?=
	=?utf-8?B?K2M3ZFF5R2Z2d0lQUDN2TlM5YVhESDBGa2lITEs1VkU5VkViSjNHWU9xMlJi?=
	=?utf-8?B?ZlBCZlMxWVVOWDNrWFI3OG1nM2ZsZUdNV2V0Ym9ZSk1XSEZMczRWYXN1OHR5?=
	=?utf-8?B?elpCeGRGalU4K0gydGRyTDVONDNVS1ZYUGdlLzRON1dCTnhDekZQVzFHbDdy?=
	=?utf-8?B?WEk4bnp4WnA1R1A2ZVoycWRjUUM4S1Fqd29LS2lXVzVmTWFqcmlmZ0J4NTBI?=
	=?utf-8?B?b05iYUdLcUdLME93K0dWK0VETGRKOCt5S2grMWxtTkdCWW8zRks0bzh5NW9u?=
	=?utf-8?B?V1NVTkc5RTBqVnl4NFBSS0E5TXk4Y0dPMzlHYnlxenV5cnRsYkVWVEtRcnJw?=
	=?utf-8?B?S3dCVlNLMXNBa2hnNWFJcDdMeVpJWG9MYjFNVUpRVDRBYWxnU0hGa3AvdDMr?=
	=?utf-8?B?L2NVSUpqWTNYbkFPcWdXNEhTK29WcmhiNENxZWc5N2hsSzBwME5mZ2Q0ZTJO?=
	=?utf-8?Q?mNo/bTuZOI2jJu5RYfVX604/oNyBPeJnwyE5vQw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 860cceee-49a5-494c-1a4e-08d966c11625
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6488.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 05:36:13.7006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pm3tEyQ6VceaEfrzcyK5Y0l5ce304xNhngr2s0u+xAjMtOp6bXUPChBgY8o4J/p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2708
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: "cluster-devel@redhat.com" <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] FS/DLM module triggered kernel BUG
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
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2021/8/23 21:49, Alexander Aring wrote:
> Hi Gang He,
> 
> On Mon, Aug 23, 2021 at 1:43 AM Gang He <GHe@suse.com> wrote:
>>
>> Hello Guys,
>>
>> I used kernel 5.13.8, I sometimes encountered the dlm module triggered kernel BUG.
> 
> What do you exactly do? I would like to test it on a recent upstream
> version, or you can do it?
I am not specifically to test the dlm kernel module.
I am doing ocfs2 related testing with opensuse Tumbleweed, which 
includes a very new kernel version.
But sometimes the ocfs2 test cases were blocked/aborted, due to this DLM 
problem.

> 
>> Since the dlm kernel module is not the latest source code, I am not sure if this problem is fixed, or not.
>>
> 
> could be, see below.
> 
>> The backtrace is as below,
>>
>> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: remove member 172204615
>> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_members 2 nodes
>> [Fri Aug 20 16:24:14 2021] dlm: connection 000000005ef82293 got EOF from 172204615
> 
> here we disconnect from nodeid 172204615.
> 
>> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: generation 4 slots 2 1:172204786 2:172204748
>> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_directory
>> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_directory 8 in 1 new
>> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_directory 1 out 1 messages
>> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_masters
>> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_masters 33587 of 33599
>> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_locks 0 out
>> [Fri Aug 20 16:24:14 2021] BUG: unable to handle page fault for address: ffffdd99ffd16650
>> [Fri Aug 20 16:24:14 2021] #PF: supervisor write access in kernel mode
>> [Fri Aug 20 16:24:14 2021] #PF: error_code(0x0002) - not-present page
>> [Fri Aug 20 16:24:14 2021] PGD 1040067 P4D 1040067 PUD 19c3067 PMD 19c4067 PTE 0
>> [Fri Aug 20 16:24:14 2021] Oops: 0002 [#1] SMP PTI
>> [Fri Aug 20 16:24:14 2021] CPU: 1 PID: 25221 Comm: kworker/u4:1 Tainted: G        W         5.13.8-1-default #1 openSUSE Tumbleweed
>> [Fri Aug 20 16:24:14 2021] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.9.1-0-gb3ef39f-prebuilt.qemu-project.org 04/01/2014
>> [Fri Aug 20 16:24:14 2021] Workqueue: dlm_recv process_recv_sockets [dlm]
>> [Fri Aug 20 16:24:14 2021] RIP: 0010:__srcu_read_unlock+0x15/0x20
>> [Fri Aug 20 16:24:14 2021] Code: 01 65 48 ff 04 c2 f0 83 44 24 fc 00 44 89 c0 c3 0f 1f 44 00 00 0f 1f 44 00 00 f0 83 44 24 fc 00 48 8b 87 e8 0c 00 00 48 63 f6 <65> 48 ff 44 f0 10 c3 0f 1f 40 00 0f 1f 44 00 00 41 54 49 89 fc 55
>> [Fri Aug 20 16:24:14 2021] RSP: 0018:ffffbd9a041ebd80 EFLAGS: 00010282
>> [Fri Aug 20 16:24:14 2021] RAX: 00003cc9c100ec00 RBX: 00000000000000dc RCX: 0000000000000830
>> [Fri Aug 20 16:24:14 2021] RDX: 0000000000000000 RSI: 0000000000000f48 RDI: ffffffffc06b4420
>> [Fri Aug 20 16:24:14 2021] RBP: ffffa0d028423974 R08: 0000000000000001 R09: 0000000000000004
>> [Fri Aug 20 16:24:14 2021] R10: 0000000000000000 R11: 0000000000000000 R12: ffffa0d028425000
>> [Fri Aug 20 16:24:14 2021] R13: 000000000a43a2f2 R14: ffffa0d028425770 R15: 000000000a43a2f2
>> [Fri Aug 20 16:24:14 2021] FS:  0000000000000000(0000) GS:ffffa0d03ed00000(0000) knlGS:0000000000000000
>> [Fri Aug 20 16:24:14 2021] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [Fri Aug 20 16:24:14 2021] CR2: ffffdd99ffd16650 CR3: 0000000002696000 CR4: 00000000000406e0
>> [Fri Aug 20 16:24:14 2021] Call Trace:
>> [Fri Aug 20 16:24:14 2021]  dlm_receive_buffer+0x66/0x150 [dlm]
> 
> It would be interesting if we got here some message from nodeid
> 172204615 and I think this is what happens. There is maybe some use
> after free going on and we should not receive anymore messages from
> nodeid 172204615.
> I recently added some dlm tracing infrastructure. It should be simple
> to add a trace event here, print out the nodeid and compare
> timestamps.
> 
> I recently fixed a synchronization issue which is not part of kernel
> 5.13.8 and has something to do with what you are seeing here.
> There exists a workaround or a simple test if this really affects you,
> simply create a dummy lockspace on all nodes so we actually never do
> any disconnects and look if you are running again into this issue.
What is this git commit? I do not want to see any kernel (warning) print 
about DLM kernel module. Sometimes, DLM would enter a stuck state after 
the DLM kernel print.
Since there were a few commits in the past weeks, I just wonder if there 
is any regression problem.

Thanks
Gang


> 
>> [Fri Aug 20 16:24:14 2021]  dlm_process_incoming_buffer+0x38/0x90 [dlm]
>> [Fri Aug 20 16:24:14 2021]  receive_from_sock+0xd4/0x1f0 [dlm]
>> [Fri Aug 20 16:24:14 2021]  process_recv_sockets+0x1a/0x20 [dlm]
>> [Fri Aug 20 16:24:14 2021]  process_one_work+0x1df/0x370
>> [Fri Aug 20 16:24:14 2021]  worker_thread+0x50/0x400
>> [Fri Aug 20 16:24:14 2021]  ? process_one_work+0x370/0x370
>> [Fri Aug 20 16:24:14 2021]  kthread+0x127/0x150
>> [Fri Aug 20 16:24:14 2021]  ? set_kthread_struct+0x40/0x40
>> [Fri Aug 20 16:24:14 2021]  ret_from_fork+0x22/0x30
> 
> - Alex
> 

