Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BA69857259
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jun 2019 22:11:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9646418DF7A;
	Wed, 26 Jun 2019 20:11:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E9A95C1A1;
	Wed, 26 Jun 2019 20:11:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E74EB1806B15;
	Wed, 26 Jun 2019 20:10:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5QK9l03028143 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 16:09:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EE5C96013C; Wed, 26 Jun 2019 20:09:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90ACA600CC;
	Wed, 26 Jun 2019 20:09:45 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0BB833086236;
	Wed, 26 Jun 2019 20:09:31 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5QK9CXN098279; Wed, 26 Jun 2019 20:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	in-reply-to; s=corp-2018-07-02;
	bh=OzU8niIx+4SJuJDg2iu/g3uoXdDBgToEow6b4jLA5Fw=;
	b=5lWMghZwhbue5Pj6GNlCOLxorKlxkgOqZ55Ny9Z7hosl9yAF3y5UYAr7jui+ZxTPcff/
	dnWi8/+5UZdqaXHXQydO4BlDbFYS1k3fwZDbvytgq3jDvh9aAzIqwZeJjG9K31XGrAuQ
	WLCG2DCeO7WwrR+Iv+C1d/acQ6x5l/nFSedrDtQxpKjrZOCwxgwrbV68QJIUuiWzorRo
	4UKKlttGLXyKaaWLdBO0jyvmopHZ/NCk+8H55r2E/n1YheINwq0+LO5jy9fzjj+zlKDV
	Zu994WHEG8YXK+AynR3Fgwc/wE9Ed9/uCkZE8ax5htw57rTx17et3SkKPGSkWVqfE5aE
	vw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2120.oracle.com with ESMTP id 2t9c9pvefp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2019 20:09:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5QK85F3127937; Wed, 26 Jun 2019 20:09:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3030.oracle.com with ESMTP id 2t99f4ndv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2019 20:09:23 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5QK9Kbo018899;
	Wed, 26 Jun 2019 20:09:20 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 26 Jun 2019 13:09:20 -0700
Date: Wed, 26 Jun 2019 13:09:19 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190626200919.GI5171@magnolia>
References: <20190626132335.14809-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626132335.14809-1-agruenba@redhat.com>
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
	[10.5.110.42]); Wed, 26 Jun 2019 20:09:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Wed, 26 Jun 2019 20:09:37 +0000 (UTC) for IP:'141.146.126.78'
	DOMAIN:'aserp2120.oracle.com' HELO:'aserp2120.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.4  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 141.146.126.78 aserp2120.oracle.com 141.146.126.78
	aserp2120.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
	linux-xfs@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH v2 1/3] iomap: don't mark the inode
 dirty in iomap_write_end
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 26 Jun 2019 20:11:24 +0000 (UTC)

On Wed, Jun 26, 2019 at 03:23:33PM +0200, Andreas Gruenbacher wrote:
> Marking the inode dirty for each page copied into the page cache can be
> very inefficient for file systems that use the VFS dirty inode tracking,
> and is completely pointless for those that don't use the VFS dirty inode
> tracking.  So instead, only set an iomap flag when changing the in-core
> inode size, and open code the rest of __generic_write_end.
> 
> Partially based on code from Christoph Hellwig.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Looks ok,
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> ---
>  fs/gfs2/bmap.c        |  2 ++
>  fs/iomap.c            | 15 ++++++++++++++-
>  include/linux/iomap.h |  1 +
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> index 93ea1d529aa3..f4b895fc632d 100644
> --- a/fs/gfs2/bmap.c
> +++ b/fs/gfs2/bmap.c
> @@ -1182,6 +1182,8 @@ static int gfs2_iomap_end(struct inode *inode, loff_t pos, loff_t length,
>  
>  	if (ip->i_qadata && ip->i_qadata->qa_qd_num)
>  		gfs2_quota_unlock(ip);
> +	if (iomap->flags & IOMAP_F_SIZE_CHANGED)
> +		mark_inode_dirty(inode);
>  	gfs2_write_unlock(inode);
>  
>  out:
> diff --git a/fs/iomap.c b/fs/iomap.c
> index 12654c2e78f8..97569064faaa 100644
> --- a/fs/iomap.c
> +++ b/fs/iomap.c
> @@ -777,6 +777,7 @@ iomap_write_end(struct inode *inode, loff_t pos, unsigned len,
>  		unsigned copied, struct page *page, struct iomap *iomap)
>  {
>  	const struct iomap_page_ops *page_ops = iomap->page_ops;
> +	loff_t old_size = inode->i_size;
>  	int ret;
>  
>  	if (iomap->type == IOMAP_INLINE) {
> @@ -788,7 +789,19 @@ iomap_write_end(struct inode *inode, loff_t pos, unsigned len,
>  		ret = __iomap_write_end(inode, pos, len, copied, page, iomap);
>  	}
>  
> -	__generic_write_end(inode, pos, ret, page);
> +	/*
> +	 * Update the in-memory inode size after copying the data into the page
> +	 * cache.  It's up to the file system to write the updated size to disk,
> +	 * preferably after I/O completion so that no stale data is exposed.
> +	 */
> +	if (pos + ret > old_size) {
> +		i_size_write(inode, pos + ret);
> +		iomap->flags |= IOMAP_F_SIZE_CHANGED;
> +	}
> +	unlock_page(page);
> +
> +	if (old_size < pos)
> +		pagecache_isize_extended(inode, old_size, pos);
>  	if (page_ops && page_ops->page_done)
>  		page_ops->page_done(inode, pos, copied, page, iomap);
>  	put_page(page);
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index 2103b94cb1bf..1df9ea187a9a 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -35,6 +35,7 @@ struct vm_fault;
>  #define IOMAP_F_NEW		0x01	/* blocks have been newly allocated */
>  #define IOMAP_F_DIRTY		0x02	/* uncommitted metadata */
>  #define IOMAP_F_BUFFER_HEAD	0x04	/* file system requires buffer heads */
> +#define IOMAP_F_SIZE_CHANGED	0x08	/* file size has changed */
>  
>  /*
>   * Flags that only need to be reported for IOMAP_REPORT requests:
> -- 
> 2.20.1
> 

