Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E898BFCF1
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Apr 2019 17:33:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 815A73199386;
	Tue, 30 Apr 2019 15:33:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D362348B8;
	Tue, 30 Apr 2019 15:33:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D4EF718089CB;
	Tue, 30 Apr 2019 15:33:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UFXYRL027234 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 11:33:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 48ACB17BBB; Tue, 30 Apr 2019 15:33:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7A3D18A49;
	Tue, 30 Apr 2019 15:33:31 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B761A3DDBE;
	Tue, 30 Apr 2019 15:33:11 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x3UFOBM9132005; Tue, 30 Apr 2019 15:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	content-transfer-encoding : in-reply-to; s=corp-2018-07-02;
	bh=E1N7i2/XGYSszDfFaE6hIiWMezb6L1pK4BEiaM0LVCs=;
	b=PWmwqwnDWFUihe1VVrUAyd5EXMuLqkncuSn5rMLjZ4BUdj2mkH1meyAyZQ3s45cZFPur
	ME0HEli7rLhsinwnN+GN5JYe7Yn1yRQzJ17Q6Tneo6DyJMv5M8i9cUSy9KZxDuaqOlKh
	meHEjnSou20VUZmznrgv68ZtpJ7RhPR1uW6PBoFbpcI9bR3yJOioTN+3CL0jXTNQISJz
	RMyYSC1+OdAq5Fp9J5JI0eksl1hPN2Jl70cEbTrmyjPlycYxBgsgW/aSKDwxK7BW/cgk
	n+AUr7eGz/UbSMQVbAcIu37IOadC3qWYLhsjx6KXLRi4vD2S2yXREGrhAWoxWGdpxDWw
	dw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2120.oracle.com with ESMTP id 2s4fqq58uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Apr 2019 15:33:01 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x3UFWhX5109947; Tue, 30 Apr 2019 15:33:00 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3030.oracle.com with ESMTP id 2s4d4ak8ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Apr 2019 15:33:00 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x3UFWwXb016341;
	Tue, 30 Apr 2019 15:32:58 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 30 Apr 2019 08:32:58 -0700
Date: Tue, 30 Apr 2019 08:32:56 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190430153256.GF5200@magnolia>
References: <20190429220934.10415-1-agruenba@redhat.com>
	<20190429220934.10415-6-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190429220934.10415-6-agruenba@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9243
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1904300095
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9243
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1904300095
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Tue, 30 Apr 2019 15:33:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Tue, 30 Apr 2019 15:33:27 +0000 (UTC) for IP:'156.151.31.85'
	DOMAIN:'userp2120.oracle.com' HELO:'userp2120.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.465  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.85 userp2120.oracle.com 156.151.31.85
	userp2120.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
	Dave Chinner <david@fromorbit.com>,
	Mark Syms <Mark.Syms@citrix.com>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH v7 5/5] gfs2: Fix iomap write page
	reclaim deadlock
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 30 Apr 2019 15:33:37 +0000 (UTC)

On Tue, Apr 30, 2019 at 12:09:34AM +0200, Andreas Gruenbacher wrote:
> Since commit 64bc06bb32ee ("gfs2: iomap buffered write support"), gfs2 is doing
> buffered writes by starting a transaction in iomap_begin, writing a range of
> pages, and ending that transaction in iomap_end.  This approach suffers from
> two problems:
> 
>   (1) Any allocations necessary for the write are done in iomap_begin, so when
>   the data aren't journaled, there is no need for keeping the transaction open
>   until iomap_end.
> 
>   (2) Transactions keep the gfs2 log flush lock held.  When
>   iomap_file_buffered_write calls balance_dirty_pages, this can end up calling
>   gfs2_write_inode, which will try to flush the log.  This requires taking the
>   log flush lock which is already held, resulting in a deadlock.

/me wonders how holding the log flush lock doesn't seriously limit
performance, but gfs2 isn't my fight so I'll set that aside and assume
that a patch S-o-B'd by both maintainers is ok. :)

How should we merge this patch #5?  It doesn't touch fs/iomap.c itself,
so do you want me to pull it into the iomap branch along with the
previous four patches?  That would be fine with me (and easier than a
multi-tree merge mess)...

--D

> 
> Fix both of these issues by not keeping transactions open from iomap_begin to
> iomap_end.  Instead, start a small transaction in page_prepare and end it in
> page_done when necessary.
> 
> Reported-by: Edwin T�r�k <edvin.torok@citrix.com>
> Fixes: 64bc06bb32ee ("gfs2: iomap buffered write support")
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/aops.c | 14 +++++---
>  fs/gfs2/bmap.c | 88 +++++++++++++++++++++++++++-----------------------
>  2 files changed, 58 insertions(+), 44 deletions(-)
> 
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index 05dd78f4b2b3..6210d4429d84 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -649,7 +649,7 @@ static int gfs2_readpages(struct file *file, struct address_space *mapping,
>   */
>  void adjust_fs_space(struct inode *inode)
>  {
> -	struct gfs2_sbd *sdp = inode->i_sb->s_fs_info;
> +	struct gfs2_sbd *sdp = GFS2_SB(inode);
>  	struct gfs2_inode *m_ip = GFS2_I(sdp->sd_statfs_inode);
>  	struct gfs2_inode *l_ip = GFS2_I(sdp->sd_sc_inode);
>  	struct gfs2_statfs_change_host *m_sc = &sdp->sd_statfs_master;
> @@ -657,10 +657,13 @@ void adjust_fs_space(struct inode *inode)
>  	struct buffer_head *m_bh, *l_bh;
>  	u64 fs_total, new_free;
>  
> +	if (gfs2_trans_begin(sdp, 2 * RES_STATFS, 0) != 0)
> +		return;
> +
>  	/* Total up the file system space, according to the latest rindex. */
>  	fs_total = gfs2_ri_total(sdp);
>  	if (gfs2_meta_inode_buffer(m_ip, &m_bh) != 0)
> -		return;
> +		goto out;
>  
>  	spin_lock(&sdp->sd_statfs_spin);
>  	gfs2_statfs_change_in(m_sc, m_bh->b_data +
> @@ -675,11 +678,14 @@ void adjust_fs_space(struct inode *inode)
>  	gfs2_statfs_change(sdp, new_free, new_free, 0);
>  
>  	if (gfs2_meta_inode_buffer(l_ip, &l_bh) != 0)
> -		goto out;
> +		goto out2;
>  	update_statfs(sdp, m_bh, l_bh);
>  	brelse(l_bh);
> -out:
> +out2:
>  	brelse(m_bh);
> +out:
> +	sdp->sd_rindex_uptodate = 0;
> +	gfs2_trans_end(sdp);
>  }
>  
>  /**
> diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> index aa014725f84a..27c82f4aaf32 100644
> --- a/fs/gfs2/bmap.c
> +++ b/fs/gfs2/bmap.c
> @@ -991,17 +991,28 @@ static void gfs2_write_unlock(struct inode *inode)
>  	gfs2_glock_dq_uninit(&ip->i_gh);
>  }
>  
> +static int gfs2_iomap_page_prepare(struct inode *inode, loff_t pos,
> +				   unsigned len, struct iomap *iomap)
> +{
> +	struct gfs2_sbd *sdp = GFS2_SB(inode);
> +
> +	return gfs2_trans_begin(sdp, RES_DINODE + (len >> inode->i_blkbits), 0);
> +}
> +
>  static void gfs2_iomap_page_done(struct inode *inode, loff_t pos,
>  				 unsigned copied, struct page *page,
>  				 struct iomap *iomap)
>  {
>  	struct gfs2_inode *ip = GFS2_I(inode);
> +	struct gfs2_sbd *sdp = GFS2_SB(inode);
>  
> -	if (page)
> +	if (page && !gfs2_is_stuffed(ip))
>  		gfs2_page_add_databufs(ip, page, offset_in_page(pos), copied);
> +	gfs2_trans_end(sdp);
>  }
>  
>  static const struct iomap_page_ops gfs2_iomap_page_ops = {
> +	.page_prepare = gfs2_iomap_page_prepare,
>  	.page_done = gfs2_iomap_page_done,
>  };
>  
> @@ -1057,31 +1068,45 @@ static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
>  	if (alloc_required)
>  		rblocks += gfs2_rg_blocks(ip, data_blocks + ind_blocks);
>  
> -	ret = gfs2_trans_begin(sdp, rblocks, iomap->length >> inode->i_blkbits);
> -	if (ret)
> -		goto out_trans_fail;
> +	if (unstuff || iomap->type == IOMAP_HOLE) {
> +		struct gfs2_trans *tr;
>  
> -	if (unstuff) {
> -		ret = gfs2_unstuff_dinode(ip, NULL);
> +		ret = gfs2_trans_begin(sdp, rblocks,
> +				       iomap->length >> inode->i_blkbits);
>  		if (ret)
> -			goto out_trans_end;
> -		release_metapath(mp);
> -		ret = gfs2_iomap_get(inode, iomap->offset, iomap->length,
> -				     flags, iomap, mp);
> -		if (ret)
> -			goto out_trans_end;
> -	}
> +			goto out_trans_fail;
>  
> -	if (iomap->type == IOMAP_HOLE) {
> -		ret = gfs2_iomap_alloc(inode, iomap, flags, mp);
> -		if (ret) {
> -			gfs2_trans_end(sdp);
> -			gfs2_inplace_release(ip);
> -			punch_hole(ip, iomap->offset, iomap->length);
> -			goto out_qunlock;
> +		if (unstuff) {
> +			ret = gfs2_unstuff_dinode(ip, NULL);
> +			if (ret)
> +				goto out_trans_end;
> +			release_metapath(mp);
> +			ret = gfs2_iomap_get(inode, iomap->offset,
> +					     iomap->length, flags, iomap, mp);
> +			if (ret)
> +				goto out_trans_end;
> +		}
> +
> +		if (iomap->type == IOMAP_HOLE) {
> +			ret = gfs2_iomap_alloc(inode, iomap, flags, mp);
> +			if (ret) {
> +				gfs2_trans_end(sdp);
> +				gfs2_inplace_release(ip);
> +				punch_hole(ip, iomap->offset, iomap->length);
> +				goto out_qunlock;
> +			}
>  		}
> +
> +		tr = current->journal_info;
> +		if (tr->tr_num_buf_new)
> +			__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
> +		else
> +			gfs2_trans_add_meta(ip->i_gl, mp->mp_bh[0]);
> +
> +		gfs2_trans_end(sdp);
>  	}
> -	if (!gfs2_is_stuffed(ip) && gfs2_is_jdata(ip))
> +
> +	if (gfs2_is_stuffed(ip) || gfs2_is_jdata(ip))
>  		iomap->page_ops = &gfs2_iomap_page_ops;
>  	return 0;
>  
> @@ -1121,10 +1146,6 @@ static int gfs2_iomap_begin(struct inode *inode, loff_t pos, loff_t length,
>  		    iomap->type != IOMAP_MAPPED)
>  			ret = -ENOTBLK;
>  	}
> -	if (!ret) {
> -		get_bh(mp.mp_bh[0]);
> -		iomap->private = mp.mp_bh[0];
> -	}
>  	release_metapath(&mp);
>  	trace_gfs2_iomap_end(ip, iomap, ret);
>  	return ret;
> @@ -1135,27 +1156,16 @@ static int gfs2_iomap_end(struct inode *inode, loff_t pos, loff_t length,
>  {
>  	struct gfs2_inode *ip = GFS2_I(inode);
>  	struct gfs2_sbd *sdp = GFS2_SB(inode);
> -	struct gfs2_trans *tr = current->journal_info;
> -	struct buffer_head *dibh = iomap->private;
>  
>  	if ((flags & (IOMAP_WRITE | IOMAP_DIRECT)) != IOMAP_WRITE)
>  		goto out;
>  
> -	if (iomap->type != IOMAP_INLINE) {
> +	if (!gfs2_is_stuffed(ip))
>  		gfs2_ordered_add_inode(ip);
>  
> -		if (tr->tr_num_buf_new)
> -			__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
> -		else
> -			gfs2_trans_add_meta(ip->i_gl, dibh);
> -	}
> -
> -	if (inode == sdp->sd_rindex) {
> +	if (inode == sdp->sd_rindex)
>  		adjust_fs_space(inode);
> -		sdp->sd_rindex_uptodate = 0;
> -	}
>  
> -	gfs2_trans_end(sdp);
>  	gfs2_inplace_release(ip);
>  
>  	if (length != written && (iomap->flags & IOMAP_F_NEW)) {
> @@ -1175,8 +1185,6 @@ static int gfs2_iomap_end(struct inode *inode, loff_t pos, loff_t length,
>  	gfs2_write_unlock(inode);
>  
>  out:
> -	if (dibh)
> -		brelse(dibh);
>  	return 0;
>  }
>  
> -- 
> 2.20.1
> 

