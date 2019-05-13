Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1201B103
	for <lists+cluster-devel@lfdr.de>; Mon, 13 May 2019 09:14:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EF1A30832EE;
	Mon, 13 May 2019 07:14:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 737EA3844;
	Mon, 13 May 2019 07:14:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B891D18089CB;
	Mon, 13 May 2019 07:14:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4D7E9HK007057 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 May 2019 03:14:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 05EF418A51; Mon, 13 May 2019 07:14:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1E1E3844;
	Mon, 13 May 2019 07:14:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2AF0637EEA;
	Mon, 13 May 2019 07:14:08 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 259EC20578;
	Mon, 13 May 2019 07:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1557731647;
	bh=u0FJlBS537HaHJw+5yUJoZ5Nb1A7lrTHIbeNy8X65VY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y/4vKkRQDVcgIpYrWEF7EXcG2x7CttfLYu4G55iSSZHUOy2F0Ihc27KfO9Xc9KOqb
	yAySn/OXtNG9O4vj8wHogZYBawVcLTQOJvabbTYMpjECsCec8HjIadxTBV3Ayn4X71
	KPQe9NGkr5e0Yna8ZFsKJgekUlzBQPZUTK3aajDs=
Date: Mon, 13 May 2019 09:14:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Tobin C. Harding" <tobin@kernel.org>
Message-ID: <20190513071405.GF2868@kroah.com>
References: <20190513033213.2468-1-tobin@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513033213.2468-1-tobin@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 13 May 2019 07:14:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Mon, 13 May 2019 07:14:08 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'gregkh@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: -5.002  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	RCVD_IN_DNSWL_HI,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<gregkh@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix error path kobject memory leak
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 13 May 2019 07:14:17 +0000 (UTC)

On Mon, May 13, 2019 at 01:32:13PM +1000, Tobin C. Harding wrote:
> If a call to kobject_init_and_add() fails we must call kobject_put()
> otherwise we leak memory.
> 
> Function always calls kobject_init_and_add() which always calls
> kobject_init().
> 
> It is safe to leave object destruction up to the kobject release
> function and never free it manually.
> 
> Remove call to kfree() and always call kobject_put() in the error path.
> 
> Signed-off-by: Tobin C. Harding <tobin@kernel.org>
> ---
> 
> Is it ok to send patches during the merge window?
> 
> Applies on top of Linus' mainline tag: v5.1
> 
> Happy to rebase if there are conflicts.
> 
> thanks,
> Tobin.
> 
>  fs/gfs2/sys.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
> index 1787d295834e..98586b139386 100644
> --- a/fs/gfs2/sys.c
> +++ b/fs/gfs2/sys.c
> @@ -661,8 +661,6 @@ int gfs2_sys_fs_add(struct gfs2_sbd *sdp)
>  	if (error)
>  		goto fail_reg;
>  
> -	sysfs_frees_sdp = 1; /* Freeing sdp is now done by sysfs calling
> -				function gfs2_sbd_release. */

You should also delete this variable at the top of the function, as it
is now only set once there and never used.

With that:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

