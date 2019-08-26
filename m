Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C52A9D710
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Aug 2019 21:58:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C97453;
	Mon, 26 Aug 2019 19:58:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C74E65D6C8;
	Mon, 26 Aug 2019 19:58:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5175EC58C;
	Mon, 26 Aug 2019 19:58:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7QJw57h018785 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Aug 2019 15:58:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 907BE5C22F; Mon, 26 Aug 2019 19:58:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0345F5C220;
	Mon, 26 Aug 2019 19:58:03 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F011918005A0;
	Mon, 26 Aug 2019 19:58:02 +0000 (UTC)
Date: Mon, 26 Aug 2019 15:58:02 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <1711812526.10714872.1566849482829.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190826161444.10573-1-agruenba@redhat.com>
References: <20190826161444.10573-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.3.117.77, 10.4.195.5]
Thread-Topic: gfs2: Fix recovery slot bumping
Thread-Index: eJg/kaZIo1LZAtBzhBpdWkbA5ldp3A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix recovery slot bumping
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Mon, 26 Aug 2019 19:58:13 +0000 (UTC)

----- Original Message -----
> Get rid of the assumption that the number of slots can at most increase by
> RECOVER_SIZE_INC (16) in set_recover_size.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/gfs2/lock_dlm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
> index 4361804646d8..2bc7a334aa0a 100644
> --- a/fs/gfs2/lock_dlm.c
> +++ b/fs/gfs2/lock_dlm.c
> @@ -1035,12 +1035,12 @@ static int set_recover_size(struct gfs2_sbd *sdp,
> struct dlm_slot *slots,
>  	}
>  
>  	old_size = ls->ls_recover_size;
> -
> -	if (old_size >= max_jid + 1)
> +	new_size = old_size;
> +	while (new_size < max_jid + 1)
> +		new_size += RECOVER_SIZE_INC;
> +	if (old_size == new_size)
>  		return 0;
>  
> -	new_size = old_size + RECOVER_SIZE_INC;
> -
>  	submit = kcalloc(new_size, sizeof(uint32_t), GFP_NOFS);
>  	result = kcalloc(new_size, sizeof(uint32_t), GFP_NOFS);
>  	if (!submit || !result) {
> --
> 2.20.1

Yes, that works, although I think it's more clear to say:
+	if (new_size == old_size)
than:
+	if (old_size == new_size)
IOW, it just sounds better. But whatever. It works either way.

Bob

