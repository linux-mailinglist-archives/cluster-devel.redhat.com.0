Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B4C35366146
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Apr 2021 22:59:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-FVZcN4yqNuuK2nc0pjbtvw-1; Tue, 20 Apr 2021 16:59:40 -0400
X-MC-Unique: FVZcN4yqNuuK2nc0pjbtvw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09FE2107ACE3;
	Tue, 20 Apr 2021 20:59:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C55CE5C1D5;
	Tue, 20 Apr 2021 20:59:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55E651806D0F;
	Tue, 20 Apr 2021 20:59:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13KKqSqF010675 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Apr 2021 16:52:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4FB0621CAC77; Tue, 20 Apr 2021 20:52:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49A6020AE831
	for <cluster-devel@redhat.com>; Tue, 20 Apr 2021 20:52:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D63AA104F0A4
	for <cluster-devel@redhat.com>; Tue, 20 Apr 2021 20:52:25 +0000 (UTC)
Received: from gateway24.websitewelcome.com (gateway24.websitewelcome.com
	[192.185.50.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-163-GVf9G4s-MdulyN1Ud-x__A-1; Tue, 20 Apr 2021 16:52:24 -0400
X-MC-Unique: GVf9G4s-MdulyN1Ud-x__A-1
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
	by gateway24.websitewelcome.com (Postfix) with ESMTP id C0A6E1BCD
	for <cluster-devel@redhat.com>; Tue, 20 Apr 2021 15:28:48 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
	id YwzIle2kl1cHeYwzIllpbs; Tue, 20 Apr 2021 15:28:48 -0500
X-Authority-Reason: nr=8
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:49080
	helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
	(envelope-from <gustavo@embeddedor.com>)
	id 1lYwzG-003Adg-Cn; Tue, 20 Apr 2021 15:28:46 -0500
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
	<84d07c8510abf95c9e656454961c09b14485b856.1605896059.git.gustavoars@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <5adf738a-315b-a80e-46ff-06822441a789@embeddedor.com>
Date: Tue, 20 Apr 2021 15:29:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <84d07c8510abf95c9e656454961c09b14485b856.1605896059.git.gustavoars@kernel.org>
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - redhat.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lYwzG-003Adg-Cn
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
	[187.162.31.110]:49080
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 221
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 006/141] gfs2: Fix fall-through warnings
	for Clang
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
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

Friendly ping: who can take this, please?

Thanks
--
Gustavo

On 11/20/20 12:25, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
> warnings by explicitly adding multiple goto statements instead of just
> letting the code fall through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  fs/gfs2/inode.c    | 2 ++
>  fs/gfs2/recovery.c | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
> index 077ccb1b3ccc..9a85214c2505 100644
> --- a/fs/gfs2/inode.c
> +++ b/fs/gfs2/inode.c
> @@ -960,6 +960,7 @@ static int gfs2_link(struct dentry *old_dentry, struct inode *dir,
>  		break;
>  	case 0:
>  		error = -EEXIST;
> +		goto out_gunlock;
>  	default:
>  		goto out_gunlock;
>  	}
> @@ -1500,6 +1501,7 @@ static int gfs2_rename(struct inode *odir, struct dentry *odentry,
>  			break;
>  		case 0:
>  			error = -EEXIST;
> +			goto out_gunlock;
>  		default:
>  			goto out_gunlock;
>  		}
> diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
> index c26c68ebd29d..5b2a01d9c463 100644
> --- a/fs/gfs2/recovery.c
> +++ b/fs/gfs2/recovery.c
> @@ -437,6 +437,7 @@ void gfs2_recover_func(struct work_struct *work)
>  		case GLR_TRYFAILED:
>  			fs_info(sdp, "jid=%u: Busy\n", jd->jd_jid);
>  			error = 0;
> +			goto fail;
>  
>  		default:
>  			goto fail;
> 

