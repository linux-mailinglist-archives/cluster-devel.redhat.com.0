Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C35B4C20C9
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Feb 2022 01:47:36 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-64cYm5GBNCWK2iiH0Xf9Cw-1; Wed, 23 Feb 2022 19:47:32 -0500
X-MC-Unique: 64cYm5GBNCWK2iiH0Xf9Cw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B50E11006AA5;
	Thu, 24 Feb 2022 00:47:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D16C641BF;
	Thu, 24 Feb 2022 00:47:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11C551809C98;
	Thu, 24 Feb 2022 00:47:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21O0iIQj011599 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Feb 2022 19:44:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E76FC5361EC; Thu, 24 Feb 2022 00:44:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2E4D5361EB
	for <cluster-devel@redhat.com>; Thu, 24 Feb 2022 00:44:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C54358038E3
	for <cluster-devel@redhat.com>; Thu, 24 Feb 2022 00:44:17 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-492-tOdit0y7Orig49zWqqGEXA-1; Wed, 23 Feb 2022 19:44:13 -0500
X-MC-Unique: tOdit0y7Orig49zWqqGEXA-1
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
	by DM6PR12MB3660.namprd12.prod.outlook.com (2603:10b6:5:1c3::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22;
	Thu, 24 Feb 2022 00:44:10 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
	([fe80::498:6469:148a:49c7]) by BY5PR12MB4130.namprd12.prod.outlook.com
	([fe80::498:6469:148a:49c7%7]) with mapi id 15.20.5017.022;
	Thu, 24 Feb 2022 00:44:10 +0000
Message-ID: <d75891d6-4c2e-57bc-f840-9d8d5449628a@nvidia.com>
Date: Wed, 23 Feb 2022 16:44:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.6.1
To: "Theodore Ts'o" <tytso@mit.edu>
References: <Yg0m6IjcNmfaSokM@google.com>
	<82d0f4e4-c911-a245-4701-4712453592d9@nvidia.com>
	<Yg8bxiz02WBGf6qO@mit.edu>
	<7bd88058-2a9a-92a6-2280-43c805b516c3@nvidia.com>
	<YhbD1T7qhgnz4myM@mit.edu>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <YhbD1T7qhgnz4myM@mit.edu>
X-ClientProxiedBy: SJ0PR05CA0067.namprd05.prod.outlook.com
	(2603:10b6:a03:332::12) To BY5PR12MB4130.namprd12.prod.outlook.com
	(2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfa57fa9-bc92-466c-bd64-08d9f72ec536
X-MS-TrafficTypeDiagnostic: DM6PR12MB3660:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3660CBB669145E0A6EA46690A83D9@DM6PR12MB3660.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: hZdWajDH93GER6kBso8pJXsE5zm9NqIEc8ICZeu7QH682ZWA/oAYYF6/pUpMcAFpDC3FQ45Iaa0StkE1uS43jTuOVUuO5axPh/zWe+enJV32WSLhR0rrlu9Yua191sVGtjlM4stcoPCeEOjQmo9HBfEf6P4RSp5saj4TdgmKto0QJIDSQvaLr3b931db1OoDHbl8THl32mPXyPWaeQ5l6/fGwMfvwlNg3yVL5NgQoHktnnSoiFV18FacrJJAVAsB5FmpKL+wYubHgm5OvlvKSczwckFnm5GwJ/XfO5Q3TEQipNDgUGkNagwL2TgcvFv4rbxCfI7dW4u4GsfmGK5BQ6/a6lPEv1WdX0YW5XVJrYYFUKa/CEa3r7XgXji3864F3ZqyZMWOMcPKb0s8zoz7lBmHZdainZRQdxTZez+p+HfVGoYCvNala9N+jDfhkd2etTfzuDVHG9WgI7ekP6y60SkkMaTYkiiTLOxqSekoKIviXeLHqHRFKT/ePDy9yLnzI8QSrtJQ1OTo9K1viQgWARKNwGnHEIXbqCgvPqDxmhr7B6BLwIJpXolouIddsmuay6VYCQdpNZiAxoDLEDK8imzXl80u5QdJpKVfMqENIRE4hlV4vxEnLPglYOj3YR/UBzDv0rHS04YhsNyAM9kKzwGJl89wmMorQ6OyZmELHRwqrvrt2EQUZUYpXF+c4pH3gf+B1U3oxEfSD9rvw/jGyvxH2NlNj5sMRXALfXmDSOnckOYs818lYKtpZmrdYAqP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR12MB4130.namprd12.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(13230001)(4636009)(366004)(5660300002)(7416002)(26005)(186003)(38100700002)(6666004)(31696002)(6506007)(66556008)(66476007)(66946007)(316002)(4326008)(36756003)(6916009)(83380400001)(54906003)(6486002)(8936002)(86362001)(508600001)(6512007)(8676002)(53546011)(31686004)(2616005)(2906002)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmZ1M1NjT0FuUHUyT0hiR1FGdDIwUkdicUw3WkMvbVo2VDdNYnNrazJJSU8z?=
	=?utf-8?B?eWZEL0NpZHhybENYVmswbDlmZm8yVGlIME95dUxvbXVFNXcxd2hVaUtuMEE5?=
	=?utf-8?B?WGN2VXNWNytndGtvemxjcFNtb211ZDRwamUxNVpRL0FzQzNhUnNnc2JRSW9B?=
	=?utf-8?B?UGV2anVzWU1jQnh2MEZTb2RGMjh0ZTNKbmtBK05jOEUxK0p6aU5YZzVnV25N?=
	=?utf-8?B?WDBzZ3RVcFJUZlNST3pyS21BejlqTDhudXlPTG80MXp3ZTJQenlmR3Nya1RN?=
	=?utf-8?B?ZDdmY0Z6WWJKUDVwMVBhZmY4V052SnhFNTQ4aGtLdDY4b1BPU25QV3FYcGNY?=
	=?utf-8?B?K0RYd0xLeEFFaDhhSmpTbW1xcmZ6VExYMXVLL3hvQ3BBdnZxY0RKdEY1VTRG?=
	=?utf-8?B?c2RLN1B2aXU2bVNiME9CWVZUVFI1MGhwZ2xHOGxXMFdCVCtUOHZGcUZyei85?=
	=?utf-8?B?L0VlWUdpcWNJS2dZRjRFYkdVMGtDcWF2OEJ3K2pCUHc3VmZZRzFvYzZxNHJI?=
	=?utf-8?B?d2UzSHhlYWtFbEM2UEk0QlUzZ2kzNVBvQjMrWUZXSFp3Um40dld3M2ZIL3FY?=
	=?utf-8?B?cXd0VTBoYXV2SWFSZFpwbm5idUM0cU9zN0gxanFRNU1tR0crSFh3T01ZN3Zy?=
	=?utf-8?B?Yk4vWGV1REptVWd0aUR0ZHl5amxrdE5KMWFmNHpQMWJSMlFtaWlaU0tmdTJq?=
	=?utf-8?B?eGdrNWVHZWhkMEtId1dXamxBSTdReXlMWm5kWi9STi9Mbzc5a0psRktZcFFW?=
	=?utf-8?B?RnpOY1JpdEFIYTZleXNkQjl0ZVpnbWRCZXJnaGNMK0NXRE43OVZ1N0JsZzht?=
	=?utf-8?B?UERsTlFQUndPT3NhKzk0allDODBXOTVuTkVrZndqNHVIZVMxcTMyZy9NZzI1?=
	=?utf-8?B?T2ZCTm1HbktkZ2E1b1htTG5KTUZuSGhjR3FYTmhmZHdLdGpoblRjLzhWYUFy?=
	=?utf-8?B?US9kc05MQTJhdlpvcGMwK2daVEJ3ZTlzWkh2UVJqLzlDcnNRanUzN3Y0ZGVv?=
	=?utf-8?B?ZEFZRWdRMXM0bDJIdFpBNGozTjV0dlhjdngrYTkvUmg0b28wVi9CV2ZzSnRu?=
	=?utf-8?B?aGkwbTJjZnhLTTFGRDMrNlRiTDVHS29ZamN2Uk5BRHgrazcycGJZa3NEalFs?=
	=?utf-8?B?L0IwamlKMjdwSzdxUFpmZ3VWdkdDaTlDa2RPb2ZkN3RmSUJkMi9OQlNIY3FV?=
	=?utf-8?B?aGxVS2ZubjErbHNyRXBDWEJVMC9ZV3p3RWdPZFp2d2NrRmFiZ0JsK1RuK3JL?=
	=?utf-8?B?YWtxbGJ0UUhjdlVFYmJGakx0dFVGZDNRS3lBcS9WbG5FZFZsZjJjdU1mNS9G?=
	=?utf-8?B?bkFHd0JSR001ekRONWQ4RnFxeEdEKzdhNW9sWjllUmdjRDZFOTNSVkJ4ZUMz?=
	=?utf-8?B?c0xFV3ZiMDJvSWNpb0M0VitkUUNJMFExVUt5R2RCbEdncEJsb0s4SDNQL0RI?=
	=?utf-8?B?eXAvRGxzRTF2aFpHSjJQbXhGVzd0UlFSSkdtSG13bUJzeTFxZGVqQnd4bGVH?=
	=?utf-8?B?NnNBZkVkd1pSdGR6ZjQ4RDMveWdNV243S21uWWZ4Z3Z3dGZUSjFWWklHWUZK?=
	=?utf-8?B?Ynk0dTlhdndlb3Fub08vRVExeWxDdW84V2QzV2UzZjJydFl3REdVbHpTYytk?=
	=?utf-8?B?ZEtJK04vSUJDR21kZ2JiclBMWWloM1RLaEV1SkEzUlpHQXFZUkozb2dTWHF0?=
	=?utf-8?B?TnJTV3RQL1FQWkg2ZmpYV3pIeXZ6ZFhEVE5Cc3ljME1yUlR0eERqNW5rK0ds?=
	=?utf-8?B?VytpU1N0dVFkcGtNam9SVjB1dHFjeE9RUDcxdUZPZnJqeDkyeXgwS2tFWGR0?=
	=?utf-8?B?WnJWam5RTXM0QXc1elIyMGlWOG5hTk9RUlJPb2RPQnd6SHhrakM4aTIzOFhj?=
	=?utf-8?B?d3lmSys2aWRHV20xZDByalFnUWs3bnBvM2w3S3BkZlVxSENYUmVCWnUxejhB?=
	=?utf-8?B?RmFZZkloa2tnUmNScys5UlUxYXZFT2wrNlFiTmZIbUt3dk9Rd1VMZzN5NGNG?=
	=?utf-8?B?b2kxTDZzUDFtSTVDeWZrT0ZsOFpUVG9pVXlKbTBBMmVWUHh3Q1Y5MFpzdFFZ?=
	=?utf-8?B?OU84V01YR2ladXd0SytyRU9ndnFFNzFRK2VSTkRNd2tZY21UR0FkdzcxUW1Q?=
	=?utf-8?B?NzVqU3JRa09kdWNFbENXK3ZCOG5QL1BKb2ZtSzdTZUlXK1FsR0xoN0s2bkJr?=
	=?utf-8?Q?YVln8dDhURHWa1oD067q3KM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa57fa9-bc92-466c-bd64-08d9f72ec536
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 00:44:09.9828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvIPq5ptTnIBUjyV9PyqhrN9nBoz2gmIbHPQMSIgOA95BtvOang2i9Nvi42kBLcqKzQ6i1mnIGs8UEQSPtA5Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3660
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Ritesh Harjani <riteshh@linux.ibm.com>,
	linux-ext4@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
	Christoph Hellwig <hch@lst.de>, Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: Re: [Cluster-devel] [REPORT] kernel BUG at fs/ext4/inode.c:2620 -
	page_buffers()
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
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/23/22 3:31 PM, Theodore Ts'o wrote:
> On Thu, Feb 17, 2022 at 10:33:34PM -0800, John Hubbard wrote:
>>
>> Just a small thing I'll say once, to get it out of my system. No action
>> required here, I just want it understood:
>>
>> Before commit 803e4572d7c5 ("mm/process_vm_access: set FOLL_PIN via
>> pin_user_pages_remote()"), you would have written that like this:
>>
>> "process_vm_writev() is dirtying pages without properly warning the file
>> system in advance..."
>>
>> Because, there were many callers that were doing this:
>>
>>     get_user_pages*()
>>     ...use the pages...
>>
>>     for_each_page() {
>>             set_page_dirty*()
>>             put_page()
>>     }
> 
> Sure, but that's not sufficient when modifying file-backed pages.

We are in complete agreement. I was just trying to hint (too subtly) 
that the problem is ages old, and after doing all this work on the 
prerequisites to solving it (pin_user_pages() is a prerequisite), it kind 
of bothers me to see a commit with "work around bugs in mm/gup.c" in the 
title. That's all. :)


> Previously, there was only two ways of modifying file-backed pages in
> the page cache --- either using the write(2) system call, or when a
> mmaped page is modified by the userspace.
> 
> In the case of write(2), the file system gets notified before the page
> cache is modified by a call to the address operation's write_begin()
> call, and after the page cache is modified, the address operation's
> write_end() call lets the file system know that the modification is
> done.  After the write is done, the 30 second writeback timer is
> triggered, and in the case of ext4's data=journalling mode, we close
> the ext4 micro-transation (and therefore the time between write_begin
> and write_end calls needs to be minimal); otherwise this can block
> ext4 transactions.
> 
> In the case of a user page fault, the address operation's
> page_mkwrite() is called, and at that point we will allocate any
> blocks needed to back memory if necessary (in the case of delayed
> allocation, file system space has to get reserved).  The problem here
> for remote access is that page_mkwrite() can block, and it can
> potentially fail (e.g., with ENOSPC or ENOMEM).  This is also why we
> can't just add the page buffers and do the file system allocation in
> set_page_dirty(), since set_page_dirty() isn't allowed to block.

Oh yes. Believe me, I am well-versed in that story! But it's always
nice to hear it again, especially from a file system maintainer.
Each time there is something new, such as the micro-transaction detail.

> 
> One approach might be to make all of the pages writeable when
> pin_user_pages_remote() is called.  That that would mean that in the
> case of remote access via process_vm_writev or RDMA, all of the blocks
> will be allocated early.  But that's probably better since at that
> point the userspace code is in a position to receive the error when
> setting up the RDMA memory, and we don't want to be asking the file
> system to do block allocation when incoming data is coming in from
> Infiniband or iWARP.

So it sounds like the file lease idea, yes? I'm hoping that that
is still viable. I still think it's a good LSF/MM topic, to work through.

> 
>> I see that ext4_warning_inode() has rate limiting, but it doesn't look
>> like it's really intended for a per-page rate. It looks like it is
>> per-superblock (yes?), so I suspect one instance of this problem, with
>> many pages involved, could hit the limit.
>>
>> Often, WARN_ON_ONCE() is used with per-page assertions. That's not great
>> either, but it might be better here. OTOH, I have minimal experience
>> with ext4_warning_inode() and maybe it really is just fine with per-page
>> failure rates.
> 
> With the syzbot reproducer, we're not actually triggering the rate
> limiter, since the ext4 warning is only getting hit a bit more than
> once every 4 seconds.  And I'm guessing that in the real world, people
> aren't actually trying to do remote direct access to file-backed
> memory, at least not using ext4, since that's an invitation to a
> kernel crash, and we would have gotten user complaints.  If some user

Actually...I can confirm that real customers really are doing *exactly* 
that! Despite the kernel crashes--because the crashes don't always 
happen unless you have a large (supercomputer-sized) installation. And 
even then it is not always root-caused properly.

I guess that goes in the "weird but true" category. :)


thanks,
-- 
John Hubbard
NVIDIA

> actually tries to use process_vm_writev for realsies, as opposed to a
> random fuzzer or from a malicious program , we do want to warn them
> about the potential data loss, so I'd prefer to warn once for each
> inode --- but I'm not convinced that it's worth the effort.
> 
> Cheers,
> 
> 						- Ted

