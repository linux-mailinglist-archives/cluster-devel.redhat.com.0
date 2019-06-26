Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A4257256
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jun 2019 22:11:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E983E3078862;
	Wed, 26 Jun 2019 20:11:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0143E1001B0E;
	Wed, 26 Jun 2019 20:10:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C40481806B16;
	Wed, 26 Jun 2019 20:10:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5QKA4Z8028492 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 16:10:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 358D95D9D6; Wed, 26 Jun 2019 20:10:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D80645D9C6;
	Wed, 26 Jun 2019 20:10:01 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59B2FC045129;
	Wed, 26 Jun 2019 20:09:42 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5QK9bYd098668; Wed, 26 Jun 2019 20:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	in-reply-to; s=corp-2018-07-02;
	bh=3wnNHw+PkdGvEkpsVr712QZt8uTfvvUBRfvdjt6LNcw=;
	b=pkT69ke4d7vkt3J6SmYq1LXjiDF+k+/rwSUd9LAzIweIAuAbd3HjBesbrrmEMr0jjxs1
	F1uaU6vVXg/niq7nCVY3AId4t+ZozHil9TAYYUdj7m9pJtlsSBhvI8JuF++Z7TG/AHtw
	185IG99UTz4plHxuasQb/97U3nJZXq1s0tWloBpiNiMwuxMdra41p390fskwznzZuizr
	e8aPXsSpM7aOI8+G+LS1kbsKuvMExjm6Pt7fGKZ5kyZfBbk9HMqczBHodkT1+y7cpTfk
	KmKEhUHR/uZZQLK+N7aZJVfT24DMdDqs3KdOkEPxf5Tzjd3IkMMrvIFn7gNZFUTSHUpz
	YQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2120.oracle.com with ESMTP id 2t9c9pvegm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2019 20:09:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5QK9RNV185507; Wed, 26 Jun 2019 20:09:39 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3020.oracle.com with ESMTP id 2tat7d11v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2019 20:09:39 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5QK9cbE019056;
	Wed, 26 Jun 2019 20:09:38 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 26 Jun 2019 13:09:38 -0700
Date: Wed, 26 Jun 2019 13:09:37 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190626200937.GJ5171@magnolia>
References: <20190626132335.14809-1-agruenba@redhat.com>
	<20190626132335.14809-2-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626132335.14809-2-agruenba@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1906260233
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1906260233
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.32]); Wed, 26 Jun 2019 20:09:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Wed, 26 Jun 2019 20:09:52 +0000 (UTC) for IP:'141.146.126.78'
	DOMAIN:'aserp2120.oracle.com' HELO:'aserp2120.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.4  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 141.146.126.78 aserp2120.oracle.com 141.146.126.78
	aserp2120.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
	linux-xfs@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH v2 2/3] fs: fold __generic_write_end
 back into generic_write_end
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 26 Jun 2019 20:11:08 +0000 (UTC)

On Wed, Jun 26, 2019 at 03:23:34PM +0200, Andreas Gruenbacher wrote:
> From: Christoph Hellwig <hch@lst.de>
> 
> This effectively reverts a6d639da63ae ("fs: factor out a
> __generic_write_end helper") as we now open code what is left of that
> helper in iomap.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

Looks ok,
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> ---
>  fs/buffer.c   | 62 ++++++++++++++++++++++++---------------------------
>  fs/internal.h |  2 --
>  2 files changed, 29 insertions(+), 35 deletions(-)
> 
> diff --git a/fs/buffer.c b/fs/buffer.c
> index e450c55f6434..49a871570092 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -2086,38 +2086,6 @@ int block_write_begin(struct address_space *mapping, loff_t pos, unsigned len,
>  }
>  EXPORT_SYMBOL(block_write_begin);
>  
> -void __generic_write_end(struct inode *inode, loff_t pos, unsigned copied,
> -		struct page *page)
> -{
> -	loff_t old_size = inode->i_size;
> -	bool i_size_changed = false;
> -
> -	/*
> -	 * No need to use i_size_read() here, the i_size cannot change under us
> -	 * because we hold i_rwsem.
> -	 *
> -	 * But it's important to update i_size while still holding page lock:
> -	 * page writeout could otherwise come in and zero beyond i_size.
> -	 */
> -	if (pos + copied > inode->i_size) {
> -		i_size_write(inode, pos + copied);
> -		i_size_changed = true;
> -	}
> -
> -	unlock_page(page);
> -
> -	if (old_size < pos)
> -		pagecache_isize_extended(inode, old_size, pos);
> -	/*
> -	 * Don't mark the inode dirty under page lock. First, it unnecessarily
> -	 * makes the holding time of page lock longer. Second, it forces lock
> -	 * ordering of page lock and transaction start for journaling
> -	 * filesystems.
> -	 */
> -	if (i_size_changed)
> -		mark_inode_dirty(inode);
> -}
> -
>  int block_write_end(struct file *file, struct address_space *mapping,
>  			loff_t pos, unsigned len, unsigned copied,
>  			struct page *page, void *fsdata)
> @@ -2158,9 +2126,37 @@ int generic_write_end(struct file *file, struct address_space *mapping,
>  			loff_t pos, unsigned len, unsigned copied,
>  			struct page *page, void *fsdata)
>  {
> +	struct inode *inode = mapping->host;
> +	loff_t old_size = inode->i_size;
> +	bool i_size_changed = false;
> +
>  	copied = block_write_end(file, mapping, pos, len, copied, page, fsdata);
> -	__generic_write_end(mapping->host, pos, copied, page);
> +
> +	/*
> +	 * No need to use i_size_read() here, the i_size cannot change under us
> +	 * because we hold i_rwsem.
> +	 *
> +	 * But it's important to update i_size while still holding page lock:
> +	 * page writeout could otherwise come in and zero beyond i_size.
> +	 */
> +	if (pos + copied > inode->i_size) {
> +		i_size_write(inode, pos + copied);
> +		i_size_changed = true;
> +	}
> +
> +	unlock_page(page);
>  	put_page(page);
> +
> +	if (old_size < pos)
> +		pagecache_isize_extended(inode, old_size, pos);
> +	/*
> +	 * Don't mark the inode dirty under page lock. First, it unnecessarily
> +	 * makes the holding time of page lock longer. Second, it forces lock
> +	 * ordering of page lock and transaction start for journaling
> +	 * filesystems.
> +	 */
> +	if (i_size_changed)
> +		mark_inode_dirty(inode);
>  	return copied;
>  }
>  EXPORT_SYMBOL(generic_write_end);
> diff --git a/fs/internal.h b/fs/internal.h
> index a48ef81be37d..2f3c3de51fad 100644
> --- a/fs/internal.h
> +++ b/fs/internal.h
> @@ -40,8 +40,6 @@ static inline int __sync_blockdev(struct block_device *bdev, int wait)
>  extern void guard_bio_eod(int rw, struct bio *bio);
>  extern int __block_write_begin_int(struct page *page, loff_t pos, unsigned len,
>  		get_block_t *get_block, struct iomap *iomap);
> -void __generic_write_end(struct inode *inode, loff_t pos, unsigned copied,
> -		struct page *page);
>  
>  /*
>   * char_dev.c
> -- 
> 2.20.1
> 

