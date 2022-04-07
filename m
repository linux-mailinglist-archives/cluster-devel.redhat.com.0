Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8434F75B2
	for <lists+cluster-devel@lfdr.de>; Thu,  7 Apr 2022 08:10:11 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-eRnu2H4HMjeKxxa21BBeug-1; Thu, 07 Apr 2022 02:10:06 -0400
X-MC-Unique: eRnu2H4HMjeKxxa21BBeug-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37AFD802819;
	Thu,  7 Apr 2022 06:10:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A62A42B953;
	Thu,  7 Apr 2022 06:10:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 60381194034E;
	Thu,  7 Apr 2022 06:10:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D83961949763 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 06:10:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B9EFC2024CC5; Thu,  7 Apr 2022 06:10:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B59B32024CBC
 for <cluster-devel@redhat.com>; Thu,  7 Apr 2022 06:09:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3E2A833974
 for <cluster-devel@redhat.com>; Thu,  7 Apr 2022 06:09:42 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-e0cDlKmTOXijgKwFnsc8YQ-1; Thu, 07 Apr 2022 02:09:39 -0400
X-MC-Unique: e0cDlKmTOXijgKwFnsc8YQ-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A29E1210E4;
 Thu,  7 Apr 2022 06:09:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4017213485;
 Thu,  7 Apr 2022 06:09:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kE04BRyATmI2UQAAMHmgww
 (envelope-from <colyli@suse.de>); Thu, 07 Apr 2022 06:09:32 +0000
Message-ID: <ac88801d-c1f9-e8a4-e0cf-e5f7cbdfbfc3@suse.de>
Date: Thu, 7 Apr 2022 14:09:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
To: Christoph Hellwig <hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
 <20220406060516.409838-27-hch@lst.de>
From: Coly Li <colyli@suse.de>
In-Reply-To: <20220406060516.409838-27-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH 26/27] block: uncouple
 REQ_OP_SECURE_ERASE from REQ_OP_DISCARD
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/6/22 2:05 PM, Christoph Hellwig wrote:
> Secure erase is a very different operation from discard in that it is
> a data integrity operation vs hint.  Fully split the limits and helper
> infrastructure to make the separation more clear.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

For the bcache part,

Acked-by: Coly Li <colyli@suse.de>


Thanks.

Coly Li


> ---
>   block/blk-core.c                    |  2 +-
>   block/blk-lib.c                     | 64 ++++++++++++++++++++---------
>   block/blk-mq-debugfs.c              |  1 -
>   block/blk-settings.c                | 16 +++++++-
>   block/fops.c                        |  2 +-
>   block/ioctl.c                       | 43 +++++++++++++++----
>   drivers/block/drbd/drbd_receiver.c  |  5 ++-
>   drivers/block/rnbd/rnbd-clt.c       |  4 +-
>   drivers/block/rnbd/rnbd-srv-dev.h   |  2 +-
>   drivers/block/xen-blkback/blkback.c | 15 +++----
>   drivers/block/xen-blkback/xenbus.c  |  5 +--
>   drivers/block/xen-blkfront.c        |  5 ++-
>   drivers/md/bcache/alloc.c           |  2 +-
>   drivers/md/dm-table.c               |  8 ++--
>   drivers/md/dm-thin.c                |  4 +-
>   drivers/md/md.c                     |  2 +-
>   drivers/md/raid5-cache.c            |  6 +--
>   drivers/mmc/core/queue.c            |  2 +-
>   drivers/nvme/target/io-cmd-bdev.c   |  2 +-
>   drivers/target/target_core_file.c   |  2 +-
>   drivers/target/target_core_iblock.c |  2 +-
>   fs/btrfs/extent-tree.c              |  4 +-
>   fs/ext4/mballoc.c                   |  2 +-
>   fs/f2fs/file.c                      | 16 ++++----
>   fs/f2fs/segment.c                   |  2 +-
>   fs/jbd2/journal.c                   |  2 +-
>   fs/nilfs2/sufile.c                  |  4 +-
>   fs/nilfs2/the_nilfs.c               |  4 +-
>   fs/ntfs3/super.c                    |  2 +-
>   fs/xfs/xfs_discard.c                |  2 +-
>   fs/xfs/xfs_log_cil.c                |  2 +-
>   include/linux/blkdev.h              | 27 +++++++-----
>   mm/swapfile.c                       |  6 +--
>   33 files changed, 168 insertions(+), 99 deletions(-)
[snipped]
> diff --git a/drivers/md/bcache/alloc.c b/drivers/md/bcache/alloc.c
> index 097577ae3c471..ce13c272c3872 100644
> --- a/drivers/md/bcache/alloc.c
> +++ b/drivers/md/bcache/alloc.c
> @@ -336,7 +336,7 @@ static int bch_allocator_thread(void *arg)
>   				mutex_unlock(&ca->set->bucket_lock);
>   				blkdev_issue_discard(ca->bdev,
>   					bucket_to_sector(ca->set, bucket),
> -					ca->sb.bucket_size, GFP_KERNEL, 0);
> +					ca->sb.bucket_size, GFP_KERNEL);
>   				mutex_lock(&ca->set->bucket_lock);
>   			}
>   


[snipped]

