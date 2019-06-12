Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCBB419E0
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Jun 2019 03:12:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8F83308213F;
	Wed, 12 Jun 2019 01:12:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B05F05C57D;
	Wed, 12 Jun 2019 01:12:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 812A5C589;
	Wed, 12 Jun 2019 01:12:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5C17xSu010689 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 21:08:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 85BF860C05; Wed, 12 Jun 2019 01:07:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7225760BF1;
	Wed, 12 Jun 2019 01:07:57 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0D5D3005159;
	Wed, 12 Jun 2019 01:07:35 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 7A0C9D575BAF6CA96BF3;
	Wed, 12 Jun 2019 09:07:31 +0800 (CST)
Received: from [127.0.0.1] (10.133.217.137) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 12 Jun 2019 09:07:29 +0800
To: Andreas Gruenbacher <agruenba@redhat.com>
References: <20190605142428.84784-1-wangkefeng.wang@huawei.com>
	<20190611162326.26967-1-agruenba@redhat.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <723b26e2-fb94-0634-1f58-fdd9eabae945@huawei.com>
Date: Wed, 12 Jun 2019 09:07:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611162326.26967-1-agruenba@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.217.137]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Wed, 12 Jun 2019 01:07:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Wed, 12 Jun 2019 01:07:49 +0000 (UTC) for IP:'45.249.212.32'
	DOMAIN:'szxga06-in.huawei.com' HELO:'huawei.com'
	FROM:'wangkefeng.wang@huawei.com' RCPT:''
X-RedHat-Spam-Score: -2.302  (RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	SPF_PASS) 45.249.212.32 szxga06-in.huawei.com
	45.249.212.32 szxga06-in.huawei.com
	<wangkefeng.wang@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH] fs: gfs2: Use IS_ERR_OR_NULL
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 12 Jun 2019 01:12:37 +0000 (UTC)



On 2019/6/12 0:23, Andreas Gruenbacher wrote:
> Kefeng,
> 
> On Wed, 5 Jun 2019 at 16:17, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>> Use IS_ERR_OR_NULL where appropriate.
> 
> It seems there are several more instances in which IS_ERR_OR_NULL should
> be used (see below).
> 

Right, will collect the following changes and send a new one, thanks.

> Thanks,
> Andreas
> 
> ---
>  fs/gfs2/dir.c        | 2 +-
>  fs/gfs2/glock.c      | 2 +-
>  fs/gfs2/inode.c      | 2 +-
>  fs/gfs2/ops_fstype.c | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
> index 3925efd3fd83..761a37a3c656 100644
> --- a/fs/gfs2/dir.c
> +++ b/fs/gfs2/dir.c
> @@ -753,7 +753,7 @@ static struct gfs2_dirent *gfs2_dirent_split_alloc(struct inode *inode,
>  	struct gfs2_dirent *dent;
>  	dent = gfs2_dirent_scan(inode, bh->b_data, bh->b_size,
>  				gfs2_dirent_find_offset, name, ptr);
> -	if (!dent || IS_ERR(dent))
> +	if (IS_ERR_OR_NULL(dent))
>  		return dent;
>  	return do_init_dirent(inode, dent, name, bh,
>  			      (unsigned)(ptr - (void *)dent));
> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> index 15c605cfcfc8..f6281470a182 100644
> --- a/fs/gfs2/glock.c
> +++ b/fs/gfs2/glock.c
> @@ -684,7 +684,7 @@ static void delete_work_func(struct work_struct *work)
>  		goto out;
>  
>  	inode = gfs2_lookup_by_inum(sdp, no_addr, NULL, GFS2_BLKST_UNLINKED);
> -	if (inode && !IS_ERR(inode)) {
> +	if (!IS_ERR_OR_NULL(inode)) {
>  		d_prune_aliases(inode);
>  		iput(inode);
>  	}
> diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
> index 998051c4aea7..1cc99da705fc 100644
> --- a/fs/gfs2/inode.c
> +++ b/fs/gfs2/inode.c
> @@ -796,7 +796,7 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
>  fail_gunlock:
>  	gfs2_dir_no_add(&da);
>  	gfs2_glock_dq_uninit(ghs);
> -	if (inode && !IS_ERR(inode)) {
> +	if (!IS_ERR_OR_NULL(inode)) {
>  		clear_nlink(inode);
>  		if (!free_vfs_inode)
>  			mark_inode_dirty(inode);
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index f5312f3b58ee..d35772d90b0a 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -579,7 +579,7 @@ static int gfs2_jindex_hold(struct gfs2_sbd *sdp, struct gfs2_holder *ji_gh)
>  
>  		INIT_WORK(&jd->jd_work, gfs2_recover_func);
>  		jd->jd_inode = gfs2_lookupi(sdp->sd_jindex, &name, 1);
> -		if (!jd->jd_inode || IS_ERR(jd->jd_inode)) {
> +		if (IS_ERR_OR_NULL(jd->jd_inode)) {
>  			if (!jd->jd_inode)
>  				error = -ENOENT;
>  			else
> 

