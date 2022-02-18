Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A521E4BB29F
	for <lists+cluster-devel@lfdr.de>; Fri, 18 Feb 2022 07:37:48 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-QdL44pHoPVGuw9K_6ukffw-1; Fri, 18 Feb 2022 01:37:46 -0500
X-MC-Unique: QdL44pHoPVGuw9K_6ukffw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18ADE1006AA4;
	Fri, 18 Feb 2022 06:37:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0637B7A231;
	Fri, 18 Feb 2022 06:37:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0BCFA1809CAA;
	Fri, 18 Feb 2022 06:37:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21I6XnhU007874 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 18 Feb 2022 01:33:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 045B42026D5D; Fri, 18 Feb 2022 06:33:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F363B2028CE7
	for <cluster-devel@redhat.com>; Fri, 18 Feb 2022 06:33:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC69185A5BC
	for <cluster-devel@redhat.com>; Fri, 18 Feb 2022 06:33:44 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-27-DGpmZJDIOtSaS63yxIZfSg-1; Fri, 18 Feb 2022 01:33:40 -0500
X-MC-Unique: DGpmZJDIOtSaS63yxIZfSg-1
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
	by DM6PR12MB4154.namprd12.prod.outlook.com (2603:10b6:5:21d::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11;
	Fri, 18 Feb 2022 06:33:36 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
	([fe80::498:6469:148a:49c7]) by BY5PR12MB4130.namprd12.prod.outlook.com
	([fe80::498:6469:148a:49c7%6]) with mapi id 15.20.4995.015;
	Fri, 18 Feb 2022 06:33:36 +0000
Message-ID: <7bd88058-2a9a-92a6-2280-43c805b516c3@nvidia.com>
Date: Thu, 17 Feb 2022 22:33:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.6.0
To: "Theodore Ts'o" <tytso@mit.edu>
References: <Yg0m6IjcNmfaSokM@google.com>
	<82d0f4e4-c911-a245-4701-4712453592d9@nvidia.com>
	<Yg8bxiz02WBGf6qO@mit.edu>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <Yg8bxiz02WBGf6qO@mit.edu>
X-ClientProxiedBy: BYAPR03CA0003.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::16) To BY5PR12MB4130.namprd12.prod.outlook.com
	(2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cd531c6-55af-402e-d113-08d9f2a897b6
X-MS-TrafficTypeDiagnostic: DM6PR12MB4154:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4154C3A8EEDA4E554D1DE8AAA8379@DM6PR12MB4154.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: mrnIrP3sACpZxPh5QsXmRId8mj1Zqbnsrluq3UnoJ8GfP8Qoq0XV89vNtPblk3USrPVj9/6eN3GkGGPJtGZS7vwJO4t7osyqdK6hhoKsGeiA212X9NLML05pQW7qoGT51RtwB9lP40kCrB75ONS02hblcmXXBnpFEk0t5zTHuD6+am0tULzxRvN18U9jeZmv6YF3KLmtIxPEtwlMfHN7lTeY0Gl3U6/PJD76kRgnCWSQ9gsdbS767MpJ637G5PLE6IwN68xsDnVIx/ySRnj7aMhr58tF+9wL1hdmcRxr+Wd1ti31xcFfIUfMX9VnGmokYlkYh7gZnj36QbmIhtGms7BsPMeG11pSqKsxL61ZLsb/Orputjvsf1Yr5y++UcPO7GpIYhGNzOoa0weiDD1FUTNWRCHEyxXRUwFQQ7TiF0KNWyY2r1/lDDkZV2IHTurpOGT/u5ksgBt7fKzKBSe7GFGsALHQyFIci6+fZTkQ/2XHfmbLx3u4j9yqETDUzRlzP47uCIQCCC6gLNP9N4LNchEd792JtnZ/CSAoF7y0cgUSBbfM9iwzyUAG3glFJeX4v6VlVPmeIHHJN7ja5Et/xQT4+bGnTmzs9vaZ9RUUPpb348kV1EgibHIiA+T8cv4UXP33D9d1QJynGCtcd4GCzMiBLK2TEHq4uiF39dGn5XPUBI373Ym3aFdvkerWpEpYdgMmDRSJbpUMXwKGfHyF+uLuZPWlXPp4vHaS4Palz+UsL0+CLsUs4q1BNxq7cJqZnHmFfSXKDhUs4rCnqCXooNUJMZ4LXmNUAqfmfTPbE9QminN7AN8p3LDx0cexJz+dppFk2d3FnJ0EjdOXu9RTTC5q9TrveZ8iyV5NMJek5X8Fv+aM/vafz+up7R908dOF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR12MB4130.namprd12.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(13230001)(4636009)(366004)(7416002)(6512007)(6506007)(2906002)(53546011)(508600001)(36756003)(31696002)(31686004)(6486002)(2616005)(26005)(186003)(6916009)(54906003)(966005)(83380400001)(316002)(86362001)(38100700002)(8676002)(4326008)(8936002)(66946007)(66556008)(5660300002)(66476007)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEVpWVpmbVVBSlBsZm03L3Izb1BMdS9NaW4rNXZnMU1hZTEwVGdRektsSTFE?=
	=?utf-8?B?ZzhJMnhRVzJZNG5LQVVQL2R3R0NNcFJHR0FsZWx6UFpRRE9lWlFTbmdxdS9t?=
	=?utf-8?B?MHNUdWpCbXhrYStvNnhYTmNTQTBHbWdFYksxS1ZGYmdWQjV6NUxqbjJEVEVz?=
	=?utf-8?B?WWZnZ1gwY3l1Yzh5OFJLWi90cEdJUE1XNktheVBTTVgzL1dwTUtQY1l4d3FR?=
	=?utf-8?B?RHV5bVVRUGwxZWE4WWtFaHpCN3hnUXZadkZBSFRyMDVSNFd4b1Rwa1JnQ09p?=
	=?utf-8?B?NWg4U1AxY3FRT2ZwL2JHRk54KzlHd05kbmdzYlZNbVl1MWZQNlZaTG9ISGsr?=
	=?utf-8?B?WGdNZS9Vd2owcEdJbjBYTUREL0RqS1pyL3FUbDQ3cnprYWNFRDdubnNwQVg5?=
	=?utf-8?B?KytkSlhsNFAvMURobjZhaXJBQ053UFEwZy94d3JYZnFNTWVpcUYrSFlRUm5z?=
	=?utf-8?B?UXJtRGxzeGYvczdzYnR2VXk3RkM3VmQ3eVlLeEg5WTVVYkYva25LME8xcEVj?=
	=?utf-8?B?VXFKbXdjY2pYeDhUWEtNa05XekU5eUY0WlFPU1RyZndPMjljRkFZL2RoSHVk?=
	=?utf-8?B?ZUFQMTdmd2tFMUFxMU5IdDVsbGNEY3dHOGRydG95ZmV0WmhIbGhUVldRZGw4?=
	=?utf-8?B?Z2g4SXlZeUU2NVBYWnhTY1VmNlIzdzc3cnpjUFpzQm9ndkNJWVEvUkxjb0pv?=
	=?utf-8?B?bDVISVo2VVRZTTJ0VDRWNi82ZWkvRlN6NDU0NzM5dnNCdnYrbEJNTTQ2T3Zi?=
	=?utf-8?B?d3EvZEVGSCtwaGRFM3o0RDMycU8vN1BMMmJzZ1JkWGtYSnpvOHBlTlVZMU8y?=
	=?utf-8?B?YnZuVE5rZ0FqdEs3SFU0SXQwTGc3SmkzWmVETnZ5NHlETHg3SHJrQzhjYnV5?=
	=?utf-8?B?ZGc2ajdrOWFyWHNqcW1FMzZFSDhaak8yNHZtaHQ4NC9WQ0l1SDZDRzdOMjdj?=
	=?utf-8?B?Q3BVb1VKU0RTbnp6MVI0MnNxRGVLellXQTBmaVZsbUpRaitVZmdnR2xnQml4?=
	=?utf-8?B?U0pxZmMvcmFEUENMS1pZSU9meldkeDNWdmFYd1VDaFdpMng5WnZidjE5eDNF?=
	=?utf-8?B?dDZOMHlpNldrVjFMc3prV0RNL3h5UFhrTHRqb1BuNjFIbEt0a0hDY3dHdUxl?=
	=?utf-8?B?aHp0UW1DcDdYbnJNbGJEWDIrbkloUGdEYjlqTmxXTFlHSE83eUlIejJyelor?=
	=?utf-8?B?N0drY0NPVldkTnpFc0pyU2FHZ3VQaGxXNlhzYWZQRjRSLytrbEtzQzYvYU02?=
	=?utf-8?B?NHZPSTVPNCtsczJzaUtvay9QL1FzTlhDc0ZNU08xRkpjS3ptTFJBcEw5OXh0?=
	=?utf-8?B?aTFvMUVHSXFMM1daR2lIeTlDMFVySlJ4dS9jSis1TWhoNDdHaUk1VW02MjB5?=
	=?utf-8?B?UGZsQXZ0WnBHVmMrMkVWWExoRU1DdUtSSGFYS1JSM2NobmowRmZPeEZuS0kx?=
	=?utf-8?B?U0hOaU9vdk43YmRWdFJ0SjhoU3Q4N3VQL3ZvSWd6ZGdpSzNoU29MNWp4Rm14?=
	=?utf-8?B?NG9kbHlpNGpiM3ByZUtwdmxvT2x4YndEWklERitBWm1xdG9CWnpkdmdvT3RW?=
	=?utf-8?B?eFMvbU5tUDkvY2grelFDUDFsRDNsQ25aUTNIUy9wcHJWZnh5QlhweVg2Mkto?=
	=?utf-8?B?MjZ5RjhZQ2NwU1ZtbWtwa2hlSk1vd2xybGhIRHc4aHYyR21vT3VkdjdpRjEx?=
	=?utf-8?B?d2VHWXp2R0hwbmJVdG5JdDl6WElDbThBWm5KQVhLc0JSZ0Ivakd1dDNQZXFa?=
	=?utf-8?B?SHlYTUtNWStMNGtpMWp5Nys4eFhoRVRFK1hONzhkdnRKNzBZb3grVExEaUU5?=
	=?utf-8?B?VEE0VzZYSHBobldNa3Fyck41WldOMTR0SytRbVlCOXIwWHh6OXQxU0Rkb1pB?=
	=?utf-8?B?VVNZc3dLMy8va040TVV4cWZ1dWJ5bEJLTmNSVnRUa2NYVkRONi9WZlNxZHh0?=
	=?utf-8?B?OEdIS1hxcGVNZldUaHlNQm52b29MU1RRd3pnYkZSK0dEaEpab3EvT20xRGxG?=
	=?utf-8?B?cDhZeTRjWnhSUkRydWlqWWY4bThENTBYRUxRajRGN1VjejVWQjF4M0duQTRu?=
	=?utf-8?B?c0FjblIrRzJoTUF1Ry83aFJSd1lzOEpQRUxLZlptRERjTDFhbHpiMUNycC8y?=
	=?utf-8?B?QlhmaC9LMFRZdVd6dnBoQUh3QjNkaTQxaGF4TEx1ajhTL0JLaUV2RXlLNEt6?=
	=?utf-8?Q?GJ5S+F426PwjWh+l8/LrJ/4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd531c6-55af-402e-d113-08d9f2a897b6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 06:33:36.4185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIxQ5mItSZeh47DTnHj6xKJEztF980Iz6c0pOgCdQ9wgjPX0COjMJUPNzmBFEGlEzC+2TCS6/eVdmFrggyd6rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4154
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/17/22 20:08, Theodore Ts'o wrote:
> On Thu, Feb 17, 2022 at 05:06:45PM -0800, John Hubbard wrote:
>> Yes. And looking at the pair of backtraces below, this looks very much
>> like another aspect of the "get_user_pages problem" [1], originally
>> described in Jan Kara's 2018 email [2].
> 
> Hmm... I just posted my analysis, which tracks with yours; but I had
> forgotten about Jan's 2018 e-mail on the matter.
> 
>> I'm getting close to posting an RFC for the direct IO conversion to
>> FOLL_PIN, but even after that, various parts of the kernel (reclaim,
>> filesystems/block layer) still need to be changed so as to use
>> page_maybe_dma_pinned() to help avoid this problem. There's a bit
>> more than that, actually.
> 
> The challenge is that fixing this "the right away" is probably not
> something we can backport into an LTS kernel, whether it's 5.15 or
> 5.10... or 4.19.
> 
> The only thing which can probably survive getting backported is
> something like this.  It won't make the right thing happen if someone
> is trying to RDMA or call process_vm_writev() into a file-backed
> memory region --- but I'm not sure I care.  Certainly if the goal is
> to make Android kernels, I'm pretty sure they are't either using RDMA,
> and I suspect they are probably masking out the process_vm_writev(2)
> system call (at least, for Android O and newer).  So if the goal is to
> just to close some Syzbot bugs, what do folks think about this?
> 
>       	      	   	  	     	- Ted

Hi Ted!

This seems reasonable...-ish. Although this could turn into a pretty
grand game of whack-a-mole, one filesystem at a time. :)


> 
> commit 7711b1fda6f7f04274fa1cba6f092410262b0296
> Author: Theodore Ts'o <tytso@mit.edu>
> Date:   Thu Feb 17 22:54:03 2022 -0500
> 
>      ext4: work around bugs in mm/gup.c that can cause ext4 to BUG()
>      
>      [un]pin_user_pages_remote is dirtying pages without properly warning
>      the file system in advance (or faulting in the file data if the page

Just a small thing I'll say once, to get it out of my system. No action
required here, I just want it understood:

Before commit 803e4572d7c5 ("mm/process_vm_access: set FOLL_PIN via
pin_user_pages_remote()"), you would have written that like this:

"process_vm_writev() is dirtying pages without properly warning the file
system in advance..."

Because, there were many callers that were doing this:

     get_user_pages*()
     ...use the pages...

     for_each_page() {
             set_page_dirty*()
             put_page()
     }

anyway, moving on smartly...

>      is not yet in the page cache).  This was noted by Jan Kara in 2018[1]
>      and more recently has resulted in bug reports by Syzbot in various
>      Android kernels[2].
>      
>      Fixing this for real is non-trivial, and will never be backportable
>      into stable kernels.  So this is a simple workaround that stops the
>      kernel from BUG()'ing.  The changed pages will not be properly written
>      back, but given that the current gup code is missing the "read" in
>      "read-modify-write", the dirty page in the page cache might contain
>      corrupted data anyway.
>      
>      [1] https://www.spinics.net/lists/linux-mm/msg142700.html

(Sorry my earlier response mangled this link. I've manually fixed it
here, and am working with our IT to get the root cause addressed.)

>      [2] https://lore.kernel.org/r/Yg0m6IjcNmfaSokM@google.com
>      
>      Reported-by: syzbot+d59332e2db681cf18f0318a06e994ebbb529a8db@syzkaller.appspotmail.com
>      Reported-by: Lee Jones <lee.jones@linaro.org>
>      Signed-off-by: Theodore Ts'o <tytso@mit.edu>
> 
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 01c9e4f743ba..3b2f336a90d1 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -1993,6 +1993,15 @@ static int ext4_writepage(struct page *page,
>   	else
>   		len = PAGE_SIZE;
>   
> +	/* Should never happen but for buggy gup code */
> +	if (!page_has_buffers(page)) {
> +		ext4_warning_inode(inode,
> +		   "page %lu does not have buffers attached", page->index);

I see that ext4_warning_inode() has rate limiting, but it doesn't look
like it's really intended for a per-page rate. It looks like it is
per-superblock (yes?), so I suspect one instance of this problem, with
many pages involved, could hit the limit.

Often, WARN_ON_ONCE() is used with per-page assertions. That's not great
either, but it might be better here. OTOH, I have minimal experience
with ext4_warning_inode() and maybe it really is just fine with per-page
failure rates.

thanks,
-- 
John Hubbard
NVIDIA

> +		ClearPageDirty(page);
> +		unlock_page(page);
> +		return 0;
> +	}
> +
>   	page_bufs = page_buffers(page);
>   	/*
>   	 * We cannot do block allocation or other extent handling in this
> @@ -2594,6 +2603,14 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
>   			wait_on_page_writeback(page);
>   			BUG_ON(PageWriteback(page));
>   
> +			/* Should never happen but for buggy gup code */
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

