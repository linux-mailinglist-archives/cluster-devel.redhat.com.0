Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F03E44C5377
	for <lists+cluster-devel@lfdr.de>; Sat, 26 Feb 2022 03:56:13 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-FarH_V0LPTSjxukcgCDnOg-1; Fri, 25 Feb 2022 21:56:09 -0500
X-MC-Unique: FarH_V0LPTSjxukcgCDnOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 826BF1854E27;
	Sat, 26 Feb 2022 02:56:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DA1389D09;
	Sat, 26 Feb 2022 02:56:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DDD1446F9A;
	Sat, 26 Feb 2022 02:56:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21Q2twGl022316 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 25 Feb 2022 21:55:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 87F6E40E7F04; Sat, 26 Feb 2022 02:55:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82E1140E7F02
	for <cluster-devel@redhat.com>; Sat, 26 Feb 2022 02:55:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 661C285A5A8
	for <cluster-devel@redhat.com>; Sat, 26 Feb 2022 02:55:58 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-586-bewn3Ec7OU2jS5VIsunmGw-1; Fri, 25 Feb 2022 21:55:54 -0500
X-MC-Unique: bewn3Ec7OU2jS5VIsunmGw-1
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
	by MN2PR12MB4471.namprd12.prod.outlook.com (2603:10b6:208:26f::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24;
	Sat, 26 Feb 2022 02:55:50 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
	([fe80::498:6469:148a:49c7]) by BY5PR12MB4130.namprd12.prod.outlook.com
	([fe80::498:6469:148a:49c7%7]) with mapi id 15.20.5017.026;
	Sat, 26 Feb 2022 02:55:50 +0000
Message-ID: <688551fd-5622-5674-62c9-3b556a0c73f6@nvidia.com>
Date: Fri, 25 Feb 2022 18:55:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.6.1
To: "Theodore Ts'o" <tytso@mit.edu>
References: <Yg0m6IjcNmfaSokM@google.com> <Yhks88tO3Em/G370@mit.edu>
	<YhlBUCi9O30szf6l@sol.localdomain> <YhlFRoJ3OdYMIh44@mit.edu>
	<YhlIvw00Y4MkAgxX@mit.edu>
	<2f9933b3-a574-23e1-e632-72fc29e582cf@nvidia.com>
	<YhlkcYjozFmt3Kl4@mit.edu>
	<303059e6-3a33-99cb-2952-82fe8079fa45@nvidia.com>
	<YhmFFMwvOaMiNBTQ@mit.edu>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <YhmFFMwvOaMiNBTQ@mit.edu>
X-ClientProxiedBy: BYAPR08CA0031.namprd08.prod.outlook.com
	(2603:10b6:a03:100::44) To BY5PR12MB4130.namprd12.prod.outlook.com
	(2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81334b26-7b77-4d6c-5d55-08d9f8d37f23
X-MS-TrafficTypeDiagnostic: MN2PR12MB4471:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB447154500C43FA07B0AA32B7A83F9@MN2PR12MB4471.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: iP3zNs/sJZfRhcl+mp1i2tfOvePKVSkFnXX6RfnBtGbviqeInKodBBbDGQOXTtrI3Z37+p4SYwS1phCW15tAHNJYzMFvGOMNxb7OzzDRz2GBspfWvjiH731k4QCRU0J+UQ69Oc3cMloNugB+P0qDJMN33+icW+7C1Swym/KUJ/kEbuCnYZMowA2GcAZgfdhrEaqchWdCNBdUPxefY2sdCfNrQUN7hOAZLN9obFutjJiJMUEQHbHPZpCkHsaFnV8tN/82scd+sZkNYmayRAkIDcePSooZUAAO+f8tGcqb9muHlKkW6ZFw8TzK2spq4mAcs1IAEwi0bHqtjfugMPP7pYxmoQakt388D8wHm0oLf7D69xIt1+n2Zoshs/unlM9NYx/fDYruKb36Sbyi9JNcMN4YSuswLWG5+SnAgeP5lPtYmXb0m1a0PgeghQbp/sFTxuMMxPs1XTdf+x+nNgdGn9LhoAqMn5Bwgu/mASxIcmPNRcvqNto4qopuSvrSv41S41sKXxYosWo3F8G4Dr4As2R1ahd6A0q7vod5uQQ9dlduJ1Yv/BR47TA7F2lSDwHu7TIPLENs6P2rFsRNizOe5O1A/cCRbznqnn0sifHmCQiCnWY8noc3+Aywn0v066D/4MCkOxKnOhDP3k0khBAb/TpCaGOpaLkBIPRtiI5+nlrHQibFRDT27t8yoe+IpwtPoF2VyfAifBrBoiVG1zlTqRJY+o0m+UdLz+6YXOYVjII71TrFk+ipHUc6t8SmoQjwGsiytAWEKrZgV9v6WAA4fw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR12MB4130.namprd12.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(13230001)(4636009)(366004)(186003)(26005)(2616005)(6512007)(6666004)(6506007)(53546011)(36756003)(38100700002)(4326008)(66476007)(66556008)(66946007)(8936002)(8676002)(7416002)(86362001)(6486002)(508600001)(5660300002)(316002)(6916009)(2906002)(54906003)(31696002)(31686004)(14143004)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG1jdERUQlJEaG1BcGFGTHl0L1ZKRnhTZENlY2NlOWh5d3YxaTFzbzhKQzFF?=
	=?utf-8?B?ZzVEeUZQNnRIdDQ0WDdxNVBSZ0o5M3ZDM0VDbEVRQ1VlckNhVlk0clhaeFFV?=
	=?utf-8?B?TDlsdVF0Z2QwUFdZc1ZsMk13SUdlU0FYbWxrbmxGS2J1eHpVcmhHZkdxVEN5?=
	=?utf-8?B?cm52UHZzZTlUUGZ6NEZkRWR3TUdKaS84UWVIRnJRVytIRWhKdG1zYk5TK2JE?=
	=?utf-8?B?U3dRZXRWd0ZKZVMxSzM5cEhBMHVKM0x1SnpNQ3BuN1paWWEyb3VmV213Qi9C?=
	=?utf-8?B?cDdYNDFiWWpENFZTTlVHVEZHRDZhek5QTjJHaElZanVCaG15TXRqbHMwc3g0?=
	=?utf-8?B?TUIyUXFYOTBpWkIzdUlKS05haHJyWEx3bXV3MjdsNTNDc2h2a2Vrb3ZNS2Rz?=
	=?utf-8?B?SDkwcHRuRjQ3emtYVmdtTitCQWtldGNKSzBNMDZFOHRueExRVmFzeDgyTTR2?=
	=?utf-8?B?cnhOYlhVaUpQRGtQU0p1U2J0Y3VSYjVTM2NPSDN1cXYvNUhmRkFoSHZBLzIz?=
	=?utf-8?B?bkV5M0tJWU5IRkhVczA5R0ZRWERtMkZuZW5Gc0swM1JMWXQ4MysvVHlnZnY5?=
	=?utf-8?B?S0VTUElkT0ZCTWJSb29Fck1nY3NkaG5LNG5EK1RmSHhFODMzeUpZUGNnVEZ2?=
	=?utf-8?B?R091T1E5VnlyZ1ZaNnZ2ZGFWYUY0SXBtc1VJNWl2NGhmK0xwMHNmMi85cWxE?=
	=?utf-8?B?cjVPcVpPcExQUUtLVG9TajNyNnA0L3RjWTdrb2hkWFpXMGJLMHZZQVdOTzBN?=
	=?utf-8?B?ZUgyRXNuYkRvYWVCaG9FbTFJOEhia2JsU3lkTjBaYk5nMXdONU5IbnI4V2xp?=
	=?utf-8?B?c2UwTVVGZUhLdFI2VUVSWmNjZ2wrUnpIZnZMYU5HQ0R3bkZiWHZGMlhaSkpP?=
	=?utf-8?B?UGtTK2pxc25KT1Z6ejk4Q0xOWUFycUphcmxnOVJvWWxER2VoTVlOVkFnQXFl?=
	=?utf-8?B?YmtWRzk4VlBBUDdseWlobElNZmEwTlp4Yk5nQXIxSUNZMTFJODFPVjI5K09S?=
	=?utf-8?B?QjlJd2xPSyswK1R0UkNBUWZTc3Y2TisweUNTejJFWjlOVnhCZDlCZTdQWGU0?=
	=?utf-8?B?UkRCUnhQNUJWNzA1RlNkRE5WYWJ4RERPUXRTLzRQNDk1blllc3dKNmpLTE1y?=
	=?utf-8?B?YVc4eWg4cEVlS2RmVW1VbjEvWFhIRXJjOEhpN0dZVkZ0SzMrMEpCNjFGMXBD?=
	=?utf-8?B?VVdvSTQxNVNsUjROTmp6UCtGMkkrOEdTRHVHVXc5MWZDR1B2MXZyY1RQT0dr?=
	=?utf-8?B?eUtPYVJ6c0V4eVZBUnlrZ3FyVjJ2Uzd4N3BNTGpBbnF6dGI4V1dRUGhSSXIw?=
	=?utf-8?B?WndJZzV2Z29EZHU4Z2g1bFlvKytOaGtqN2k3d1hUK2VlZllRZzhEbEJtaE5U?=
	=?utf-8?B?THVHRnI2amFsRk1ZZkltMlUybDZ0M25SZE5DeCtXOEVJZTlFM1dFcms3TmJX?=
	=?utf-8?B?VllGK3NZdVN1bUNQUS9SczloVG1lbFZmMnlHTE50ZElwdm0wWlZuc0REM3Np?=
	=?utf-8?B?K3FwS2ZnMUtVZVYvNzZpVmgvNkpaQnp6Zm1YQmJDWnlDV1NKV1lRZ243WHBi?=
	=?utf-8?B?RTVoRFkvMEdzU1IvV2NtWDEwbEpUdFo2T1pLVmgwKzNpZVlaU0p2VHd2T1JN?=
	=?utf-8?B?RFdxaEpnYVdrNzNhcnk0LzN4dW9LZHVqV0E3NExIUzZjdUYvT0tOcnJVTXpB?=
	=?utf-8?B?V014MHd1T1pHN0w1bEpPeTZxYVh6bU1JbUNHNlVDUDlPS2VqaDdJWTVneTc3?=
	=?utf-8?B?ZWd1dDFOS0pyZmx6alYxV2YySjNPZXRSMWhjeHFUZ09jbGdlYWNzK2Q5Ylk4?=
	=?utf-8?B?QWxwYkZnOHhwMlFxQnE2MXBmMnl1YWptam40UC9xZXdpSFBtb0NkUDZkMEk4?=
	=?utf-8?B?YzlrRVdnaHBOaWpFSGxhL2RLeU9NYlBjL1R1Yy9xUTRwVStmUEhHbkgxNXZ4?=
	=?utf-8?B?elpNYU9hMzZJK0J4WnZsKzhqVHptOXFiZGNjOHpDVVpTNlVNdG5NMVB1WkM3?=
	=?utf-8?B?dkRWdThBSy9pWHZSWkhrbVdtWWNhVGsxQTFrVGZvY1hZTmlFZHhaWGFidTBi?=
	=?utf-8?B?aWtWNE4wd0RBdXpBbUszNk1jTXhHMVcvazJwMCt6K0ROUXZtOTBmOTkzdGYv?=
	=?utf-8?B?N0FSTDMwUGYvd1ZadkZNN1BMMzdBM0JBTnphbER6RGFzekxEcDJkUmJGRDI3?=
	=?utf-8?Q?CVXXFeMM7p4xuA5T3wsdXxU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81334b26-7b77-4d6c-5d55-08d9f8d37f23
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2022 02:55:50.6641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPuj6CZ0dNBgMnjECy9wvnvUDvXF541+py6Si/mOxuQY/mJCBCF1Mz/ImrWcM7Z+OVqRYexXnvng81fy/n/8PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4471
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org,
	Ritesh Harjani <riteshh@linux.ibm.com>,
	linux-ext4@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
	Christoph Hellwig <hch@lst.de>, Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: Re: [Cluster-devel] [PATCH -v3] ext4: don't BUG if kernel
 subsystems dirty pages without asking ext4 first
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
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/25/22 17:40, Theodore Ts'o wrote:
...
>> ...and then put them in a filesystem header file, because these are now
>> tightly coupled to filesystems, what with the need to call
>> .write_begin() and .write_end().
> 
> Well, that makes it process_vm_writev()'s is that it needs to know
> when to call pin_user_file_pages().  I suspect that for many use cases
> --- for example, if this is being used by a debugger to modify a
> variable on a stack, or an anonymous page in the program's data
> segment, process_vm_writev() *isn't* actually pinning a file.  So they
> want some kind of interface that automatically DTRT regardless of
> whether the user pages being edited are file-backed or not
> file-backed.
> 
> So some kind of [un]pin_user_pages_local() which will call
> write_{begin,end}() if necessary would be the most convenient for
> users such as process_vm_writev().
> 

OK, yes.

> And perhaps would it make sense for pin_user_pages to optionally (or
> by default?) check for file-backed pages, and if it finds any, return
> an error or stop pinning pages at that point, so the system call can
> return EOPNOSUPP to the user, instead of silently causing user data to
> be lost or corrupted as is currently the case with xfs and btrfs (and
> ext4 once I patch it so it doesn't BUG).

Yes, also a good move. It is definitely time for this.

> 
> I'll note that at least one caller of pin_user_pages, in fs/io_uring.c
> takes it upon itself to check for file-backed pages, and returns

Well, not *exactly*: fs/io_uring.c calls is_file_hugepages(), which is a
check for hugetlbfs, rather than general check for file-backed pages. :)

But your point is still valid, and taken. The overall approach of,
"check for page type, then pin pages" is being done there.

> EOPNOTSUPP if there are any found.  Many that should be lifted to
> pin_user_pages()?
> 
> For that matter, maybe pin_user_pages() and friends should take some
> new FOLL_ flags to indicate whether file-backed pages should be
> rejected, or perhaps they can promise they will only be holding the
> pin for a very short amount of time (FOLL_SHORTERM?), and then

Naming: there is already a FOLL_LONGTERM, so anyone not using that is
already...non-FOLL_SHORTERM, so that would be too difficult to
understand.

Instead, maybe: FOLL_FILE, to indicate basically the inverse of your
FOLL_SHORTERM suggestion. And sweep through and augment the call sites
to pass in FOLL_FILE *at first*, so that the first patch leaves behavior
as-is. Then a patch per call site (bisection friendly), to start
actually changing behavior and dealing with the fallout.


> pin_user_pages() and unpin_user_pages() can automagically call
> write_begin() and write_end() if necessary?  I dunno....
> 
> 	      	  	      	 	       - Ted

This all sounds good to me. Thanks for thinking about this. I think this
is actually pretty easy to implement, too.


thanks,
-- 
John Hubbard
NVIDIA

