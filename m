Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BD64C50C3
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Feb 2022 22:34:24 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-l0O4h3fdPeyhXJXLflSvHA-1; Fri, 25 Feb 2022 16:34:22 -0500
X-MC-Unique: l0O4h3fdPeyhXJXLflSvHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E705180A08B;
	Fri, 25 Feb 2022 21:34:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E135848DD;
	Fri, 25 Feb 2022 21:34:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E0424BB40;
	Fri, 25 Feb 2022 21:34:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21PLXiaF018459 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 25 Feb 2022 16:33:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5EEE54022EF; Fri, 25 Feb 2022 21:33:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59F33492D42
	for <cluster-devel@redhat.com>; Fri, 25 Feb 2022 21:33:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C88E85A5BE
	for <cluster-devel@redhat.com>; Fri, 25 Feb 2022 21:33:44 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-232-V48IhIdCPMuAw5m_PcYDOA-1; Fri, 25 Feb 2022 16:33:40 -0500
X-MC-Unique: V48IhIdCPMuAw5m_PcYDOA-1
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
	by BN6PR12MB1153.namprd12.prod.outlook.com (2603:10b6:404:19::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22;
	Fri, 25 Feb 2022 21:33:37 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
	([fe80::498:6469:148a:49c7]) by BY5PR12MB4130.namprd12.prod.outlook.com
	([fe80::498:6469:148a:49c7%7]) with mapi id 15.20.5017.026;
	Fri, 25 Feb 2022 21:33:37 +0000
Message-ID: <2f9933b3-a574-23e1-e632-72fc29e582cf@nvidia.com>
Date: Fri, 25 Feb 2022 13:33:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.6.1
To: "Theodore Ts'o" <tytso@mit.edu>, Eric Biggers <ebiggers@kernel.org>
References: <Yg0m6IjcNmfaSokM@google.com> <Yhks88tO3Em/G370@mit.edu>
	<YhlBUCi9O30szf6l@sol.localdomain> <YhlFRoJ3OdYMIh44@mit.edu>
	<YhlIvw00Y4MkAgxX@mit.edu>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <YhlIvw00Y4MkAgxX@mit.edu>
X-ClientProxiedBy: BY3PR05CA0024.namprd05.prod.outlook.com
	(2603:10b6:a03:254::29) To BY5PR12MB4130.namprd12.prod.outlook.com
	(2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 506e02e4-d65b-477b-5be8-08d9f8a67b7d
X-MS-TrafficTypeDiagnostic: BN6PR12MB1153:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1153E653EBFEDAAE2580F408A83E9@BN6PR12MB1153.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: WTHDBf3Z/mNTIYmrUcyuntsOhEUDWGH0N+I0VaspBEQ+TsnKxm3CtL4dg7onddNKUjQ48/x/yCi8TsE0LYDqMqQG31UYZ/+picbn2s7L3YDi5Mp8NjQMMG7bcfVlUz2MMRu0nuuURuQ3ovGphdKQ4IPiJRyz0MjT7vCuNqUFshdhnxN0XXuqes3bHApwEThvMQ/Q68yBYWm/vW+6tbdagmhQZarPK3FIin8OxcwVnFY6pkSAQe5mlrEnEjtRsAbM8DxqLf7tYzr17nEoRo86uBYifNp4VINceLsIKyvd6Dh21oOBgM6iPfC2EMiJjZTMidB6b3VjaorXmrodZ9+3D08PYKu5ujOyCowslwHCLKB/RswBEO492hOtaJV6vs7V4GLW5sMj9PojMc/4RLyvpDdJlElDvxpP2LauZoDWzXyERWELFcuK/HwWZjGsGUBgSV8J5INNhmXVmAAQyDQJW+VnJ5zjUDboLVp+2zEONEu4uRPrvNfYRcaNBK2lFYx+WruFHc485xBpXiv/YAhRGZl4HyCDpFNL83Hx59xN+T/cx9P484hp8uvSSHk0FqrBioRk6KeC2B9ypDtgJ/aY23XUXrHzAdF1Oxb2j77OCjD8yqhbKu/gSQNDNU86EaDbCM52mXr2/Et9BSVxTpHTcpNuihnE7OFQQAQGZfCkJMvXrcHUxlYmHF1yVDx59z9JE3ePDmkrgGLKMB/Hi5UW73fIuGBDNDGZ8FuOoDd0N9Vs2bnujuWVkYov2Fyy13nzJ/LMS8BaJui2nLOSSjnoXwR3IZHWULjm1k22mUBsTadZAHlJZv3X6j4wUW6IzkJ2i2oM0Xt7pXuiYkJ+1DUBNP6RovXNkgxZXc4OVJujAY3Y8wVaBT0Qis/j8izE6Wt+IP1MNaTxWyowVvDWVSbZaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR12MB4130.namprd12.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(13230001)(4636009)(366004)(6486002)(66946007)(66476007)(8676002)(86362001)(966005)(83380400001)(6506007)(66556008)(6666004)(508600001)(4326008)(6512007)(2616005)(31696002)(53546011)(110136005)(26005)(54906003)(186003)(316002)(38100700002)(36756003)(2906002)(8936002)(31686004)(5660300002)(7416002)(14143004)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEMxc2g3QlVBaldNdC9SMTlkRVlsbk95SFc5K0dsNjVOZGRxcjV5K1BiWU5o?=
	=?utf-8?B?TXVBWmRDMGx5ZXl0dXE2Y0NwRlZEVkFLallVb01KaElvbW5KWkVjTWVpVG9J?=
	=?utf-8?B?RGlXRytZd3dpcG0vdkoxKzFHaEV2R0FDL25WeFMvdjJYWDdLbysxQWtvTFIw?=
	=?utf-8?B?ak5iRVhhcDloN05zN0ZjMmdreHZhL2pLTTZtakFWUElpc09PczlQc2x3UFJo?=
	=?utf-8?B?bUU3ZEJISm5zbGc5OU5yRHdQUnNvazZKbWNQcUc0YWNIdVptRmZRR2pQZC9I?=
	=?utf-8?B?bExVVWhvOGpad1MzVmk5eWVtMjAxaG1BbVFibElQbk4yWm1EMytSWDk1a0pn?=
	=?utf-8?B?OEFuaTFtdkZ2eXEzL0RQRjNuWS85R002RFJMY052cTNvdjhERUZsWjJ0SFZT?=
	=?utf-8?B?bm9SNlVhQTQ0UkVhVmZ5cVR0SGhuSXVEWnNvQlhwTjNVbkZOS1ZVeWJ5QTFq?=
	=?utf-8?B?VDAvZ0M2SFpmN09zQ2J2RVF6aFpKejRMbzF5Zm5tWHIxSzAvYWlDaXpVRjhK?=
	=?utf-8?B?dnptSTVrc2MxVEdham5qRGoyNVpacTFJQlBOQ3RINTNHUDE2clpSNW9uRmFH?=
	=?utf-8?B?d3VONnhKNS9VWDBxVXhxVHM0OGNwVnk5L2Jva1dyUUhCMlNUeXA5aTc2dFR3?=
	=?utf-8?B?bVhLcHBRNDhOc3RmZjJFaEZCT1Y0R1BmUU5QSWZ2MnBRWDNYSnBiWWFjT1do?=
	=?utf-8?B?WjdNalI4eVlzdGlodk1GbnByb1N2NmFaektKd1MwN2RVZk9lVmNKQy9Ya1hw?=
	=?utf-8?B?MnpVY0U4WXpBYVBoZjRpZjFVeVFzU0hzbFBzcUkvM2YyK2k4M0cxWUF5MGt6?=
	=?utf-8?B?STBqdnhWSXRteWFKYUhpSVUva3Fkd2dhUVZJNnlJT3hpRUYyNkZ0WUN4aWlN?=
	=?utf-8?B?R3ZtTUovTGg2V1BwSjdnb0szMUxvOG5pdWxZMkVBR0J4elhSVDREeC9HeTB0?=
	=?utf-8?B?L2FHWVp1eTF1RW0yWHdQcDFVVXJUYVlxUnh6UDVjank1UjE5TFR5ZXhtWmto?=
	=?utf-8?B?STYvYmtGb0ZWeE9kOFpIcnRFUzhoTXRXS2ExUkVWYVREYS9uV2g0ZUpNenFT?=
	=?utf-8?B?YUQ5M1E2bnVFVFQ2Nm5UOWxzMVlhMURwbkRuMEttYzNINnlCRTM4bGFBaEFU?=
	=?utf-8?B?anljblRFdVR1QjZBcHphejFMSHlBZGVoN2t2SEhqVkl1Q3ZzampvRHBkZzhy?=
	=?utf-8?B?VjJDMWRoK0dWOEtRaG04UlBrcEk4VjdOYjgzYzhWTFdCZW9IVk1SVHBrVmkz?=
	=?utf-8?B?S2lieUNnd25Sc2Iyc09MNWQrcE9lYlFUZDdtWm9LSEt0bGtnRWNqYUxnNkNO?=
	=?utf-8?B?WnRoT2czbUJOZitVOXlzdGNDejhzOUlHcGhoUXlYWDRoajlmSGdpLzl1ckxx?=
	=?utf-8?B?U1NNRE5Td3RPVGdGNE5EbXRhVVY3UEs2UkVhajNsbUkrT2FreE53NUNWZHhz?=
	=?utf-8?B?S01tY2t2Z3QxVDcrTUxETUtid243NnhWYmRETnZrUWszWFdybmFRa2lCV0lH?=
	=?utf-8?B?OEY4RUl0REVsUVR3R2prZ0ViVDc0aHVmUUtoS2hxVGtqaW1Hb1JGczFjNDVW?=
	=?utf-8?B?N3MxVGJ6d05xS1J4dVZmUkNJL2RveXN2SjlJV1lDSkxLSUt4dldteitWbVhs?=
	=?utf-8?B?TGJzaENrYTlUZVRPMGhIR3pFT2tvMDk0cTAweDVDZWZ4dWJNM3FrR09kWlE0?=
	=?utf-8?B?NDFjMVlmVjFKc1JRYjJMaXFtSzhNRWVNSGRRbWdIY21HclRXempyZFBua2Nl?=
	=?utf-8?B?ZXhNc0RoWVJzLzNiL0d0Q0djeldpdTFFa0ZzLzIxcWtPMEdkbHFwdSt3UWxH?=
	=?utf-8?B?bnNWTEsyTitPRmNWcHBCZWU0bzhIeGdBekJlZURDR3lBWUg5RzFmNEFvMERI?=
	=?utf-8?B?ZXJmQnVrMTJWckk4Wlp4YmszcDU3L0FHd1cxRkhoWnAxVlVvSmlBcmFhekcx?=
	=?utf-8?B?QlQ3OHJXdnZ2cmtKYllGZ1pIejFRVVdvUkJ1dDgwM3ZWcWx0WUtqanVHMXR5?=
	=?utf-8?B?akxqZVUrSStSRHA5K0hXSS9BMERZNndyVlluZ0lxTXI4TUxkYWJHeDVCSXQ1?=
	=?utf-8?B?ZXMrTG5jMDBuVFloTkZDRTFmNFlVaUJGVDZvSjJKVE1TNWUrVmpicEh2MnVN?=
	=?utf-8?B?cW5KY1NOcnpaeFFvMFNpVnBFN1kxSGJ4cjBTZmo0K2lWK2ZkTG5VSTR0Vk1R?=
	=?utf-8?Q?5P6fwexbWxX5gL9qU1d9PkY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 506e02e4-d65b-477b-5be8-08d9f8a67b7d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 21:33:37.0958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01V3pwCNaEB80XWkEiegMaAafngjOoFR3nYM0eKejkwnh30yc5+xOa/ojSfmrza5RfhyQaVlo6GWnZcSYJmZcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1153
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Ritesh Harjani <riteshh@linux.ibm.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/25/22 13:23, Theodore Ts'o wrote:
> [un]pin_user_pages_remote is dirtying pages without properly warning
> the file system in advance.  This was noted by Jan Kara in 2018[1] and

In 2018, [un]pin_user_pages_remote did not exist. And so what Jan reported
was actually that dio_bio_complete() was calling set_page_dirty_lock()
on pages that were not (any longer) set up for that.

> more recently has resulted in bug reports by Syzbot in various Android
> kernels[2].
> 
> This is technically a bug in mm/gup.c, but arguably ext4 is fragile in

Is it, really? unpin_user_pages_dirty_lock() moved the set_page_dirty_lock()
call into mm/gup.c, but that merely refactored things. The callers are
all over the kernel, and those callers are what need changing in order
to fix this.


thanks,
-- 
John Hubbard
NVIDIA

> that a buggy kernel subsystem which dirty pages without properly
> notifying the file system causes ext4 to BUG, while other file systems
> are not (although user data likely will be lost).  I suspect in real
> life it is rare that people are using RDMA into file-backed memory,
> which is why no one has complained to ext4 developers except fuzzing
> programs.
> 
> So instead of crashing with a BUG, issue a warning (since there may be
> potential data loss) and just mark the page as clean to avoid
> unprivileged denial of service attacks until the problem can be
> properly fixed.  More discussion and background can be found in the
> thread starting at [2].
> 
> [1] https://lore.kernel.org/linux-mm/20180103100430.GE4911@quack2.suse.cz
> [2] https://lore.kernel.org/r/Yg0m6IjcNmfaSokM@google.com
> 
> Reported-by: syzbot+d59332e2db681cf18f0318a06e994ebbb529a8db@syzkaller.appspotmail.com
> Reported-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Theodore Ts'o <tytso@mit.edu>
> ---
>   fs/ext4/inode.c | 27 ++++++++++++++++++++++++++-
>   1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 01c9e4f743ba..008fe8750109 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -1993,6 +1993,15 @@ static int ext4_writepage(struct page *page,
>   	else
>   		len = PAGE_SIZE;
>   
> +	/* Should never happen but for bugs in other kernel subsystems */
> +	if (!page_has_buffers(page)) {
> +		ext4_warning_inode(inode,
> +		   "page %lu does not have buffers attached", page->index);
> +		ClearPageDirty(page);
> +		unlock_page(page);
> +		return 0;
> +	}
> +
>   	page_bufs = page_buffers(page);
>   	/*
>   	 * We cannot do block allocation or other extent handling in this
> @@ -2588,12 +2597,28 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
>   			     (mpd->wbc->sync_mode == WB_SYNC_NONE)) ||
>   			    unlikely(page->mapping != mapping)) {
>   				unlock_page(page);
> -				continue;
> +				goto out;
>   			}
>   
>   			wait_on_page_writeback(page);
>   			BUG_ON(PageWriteback(page));
>   
> +			/*
> +			 * Should never happen but for buggy code in
> +			 * other subsystems that call
> +			 * set_page_dirty() without properly warning
> +			 * the file system first.  See [1] for more
> +			 * information.
> +			 *
> +			 * [1] https://lore.kernel.org/linux-mm/20180103100430.GE4911@quack2.suse.cz
> +			 */
> +			if (!page_has_buffers(page)) {
> +				ext4_warning_inode(mpd->inode, "page %lu does not have buffers attached", page->index);
> +				ClearPageDirty(page);
> +				unlock_page(page);
> +				continue;
> +			}
> +
>   			if (mpd->map.m_len == 0)
>   				mpd->first_page = page->index;
>   			mpd->next_page = page->index + 1;


