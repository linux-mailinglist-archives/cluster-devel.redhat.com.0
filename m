Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 61D6528E6D8
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 21:01:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602702084;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=p+JrADlr5t+YAAhULA0pqV3ZIZBiEjPrGaYhwMVIKV4=;
	b=gO78+Xeh8lGL0wU5+dSvBBhWQMyzumIUbxLgGOG3HHjm5vKIki1+1x4AeUYg1j2hL5bqkM
	cd2paU3xRINKPWYLUPn0CPPt6d+nfTv/Ty8df0Dbkd7sf61yjypXWzkVjpHfDk7mwrwQu9
	Dj+bZzdRqbBZ5hBKBtkY15C+YA6dDHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-Yc7zvlxgP0G2q__EVcnwfQ-1; Wed, 14 Oct 2020 15:01:22 -0400
X-MC-Unique: Yc7zvlxgP0G2q__EVcnwfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 865691018F84;
	Wed, 14 Oct 2020 19:01:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B3256EF5E;
	Wed, 14 Oct 2020 19:01:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C26958116;
	Wed, 14 Oct 2020 19:01:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09EJ189m013137 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 15:01:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 876DC1013021; Wed, 14 Oct 2020 19:01:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8396611CC254
	for <cluster-devel@redhat.com>; Wed, 14 Oct 2020 19:01:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31FC78582B3
	for <cluster-devel@redhat.com>; Wed, 14 Oct 2020 19:01:06 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-174-S45r1b3NO-WMe2AqDEkGhg-1; Wed, 14 Oct 2020 15:01:04 -0400
X-MC-Unique: S45r1b3NO-WMe2AqDEkGhg-1
Received: by mail-wr1-f72.google.com with SMTP id 2so77641wrd.14
	for <cluster-devel@redhat.com>; Wed, 14 Oct 2020 12:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p+JrADlr5t+YAAhULA0pqV3ZIZBiEjPrGaYhwMVIKV4=;
	b=pfG0HqZdXKngl2utR3mOkG3HzqSmwBcYG7V4g2VnRvj9AhmVG0GdIWcC7/fOpNgODs
	bEb6vF5txFgTD8qPG5kBo7HwU7saXohz19Ph4M1tHRX3FQdyPCUJEcCwgaS0fMBMIdo+
	LRgc6tVdAhEfFksWFwfbaWXIe+ClcJmvN14SwXChxgyUv9ShxC/Fe1IiBk58CuKdxLw1
	ArVWg5yDrAiF4cv35UHYPsS+MBU8903RaD9fjkbzEXS5/pIsaz6f8dxMIRZz6y8P2Eg7
	znT08FnNFuavf9uMwCukdWty3rQ3LguLB1GGRRE0RGvAYI+oI7/rNtR0B0KQEliM1fA9
	7NUQ==
X-Gm-Message-State: AOAM530KPNYIL5cl7kPjeg5c28k/zBAeqk7SaavQRuWvnegChUVAAc3v
	HzFr5CcXPzHWt6BO2dmfCP/V5PFpMIqGGekrOhDIEXGK9SNPz3WUlIea1//aQdxC6Y8C7k1Sda+
	jFN1U33mCt74Q50tNxUcF6Bkn1dghfwafpwIGmg==
X-Received: by 2002:a5d:458c:: with SMTP id p12mr186318wrq.329.1602702063050; 
	Wed, 14 Oct 2020 12:01:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh2JO2W6NeN0RV0lJkM57TwsR/X2vWR2a922i5/AIOwJDPP4K8W/FoMQAz+75TJkFLDN3hGuG8+rsCNlnVocI=
X-Received: by 2002:a5d:458c:: with SMTP id p12mr186290wrq.329.1602702062813; 
	Wed, 14 Oct 2020 12:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201014163109.98739-1-anant.thazhemadam@gmail.com>
In-Reply-To: <20201014163109.98739-1-anant.thazhemadam@gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 14 Oct 2020 21:00:51 +0200
Message-ID: <CAHc6FU5s3xL745-gUueSW3JO+V78ySsk1ueZ6tT-jrc6w5FD5g@mail.gmail.com>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: syzbot+af90d47a37376844e731@syzkaller.appspotmail.com,
	Fox Chen <foxhlchen@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
	syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com,
	cluster-devel <cluster-devel@redhat.com>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Cluster-devel] [PATCH v2] fs: gfs2: add validation checks for
	size of superblock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Anant,

On Wed, Oct 14, 2020 at 6:31 PM Anant Thazhemadam
<anant.thazhemadam@gmail.com> wrote:
> In gfs2_check_sb(), no validation checks are performed with regards to
> the size of the superblock.
> syzkaller detected a slab-out-of-bounds bug that was primarily caused
> because the block size for a superblock was set to zero.
> A valid size for a superblock is a power of 2 between 512 and PAGE_SIZE.
> Performing validation checks and ensuring that the size of the superblock
> is valid fixes this bug.
>
> Reported-by: syzbot+af90d47a37376844e731@syzkaller.appspotmail.com
> Tested-by: syzbot+af90d47a37376844e731@syzkaller.appspotmail.com
> Suggested-by: Andrew Price <anprice@redhat.com>
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
>
> Changes in v2:
>
>         * Completely dropped the changes proposed in v1. Instead,
>           validity checks for superblock size have been introduced.
>           (Suggested by Andrew Price<anprice@redhat.com>)
>
>         * Addded a "Suggested-by" tag accrediting the patch idea to
>           Andrew. If there's any issue with that, please let me know.
>
>         * Changed the commit header and commit message appropriately.
>
>         * Updated "Reported-by" and "Tested-by" tags to the same instance
>           of the bug that was detected earlier (non consequential change).
>
>
>  fs/gfs2/ops_fstype.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 6d18d2c91add..f0605fae2c4c 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -169,6 +169,13 @@ static int gfs2_check_sb(struct gfs2_sbd *sdp, int silent)
>                 return -EINVAL;
>         }
>
> +       /* Check if the size of the block is valid - a power of 2 between 512 and  PAGE_SIZE */
> +       if (sb->sb_bsize < 512 || sb->sb_bsize > PAGE_SIZE || (sb->sb_bsize & (sb->sb_bsize - 1))) {
> +               if (!silent)
> +                       pr_warn("Invalid superblock size\n");
> +               return -EINVAL;
> +       }
> +

I'll add that to for-next.

Thanks,
Andreas

