Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 75193788E78
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Aug 2023 20:19:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692987540;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=U4D+jydLBsrEk9epSw1Xd2pmQXZkEuzlz2GDYJy25E0=;
	b=fpVh7oWR0Acl7XhczdrDoChEOl1CekfJsT/R1+w3s4lf/QJY+fH0kzyIEgKq0bgJl+4DQ3
	M0CBgIcOFou9xlH+xpm2Tl54QEGbl8DraUNww4bI3fSM3iy08md6lHmskMf/mOMx+pQ0+A
	SygVyGHq8j6mEXigvFoYpB/COyMMOik=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-0tmuwfEJOA-gU2YYVJKBbg-1; Fri, 25 Aug 2023 14:18:57 -0400
X-MC-Unique: 0tmuwfEJOA-gU2YYVJKBbg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81893800270;
	Fri, 25 Aug 2023 18:18:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7634D492C14;
	Fri, 25 Aug 2023 18:18:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 51BF119465B3;
	Fri, 25 Aug 2023 18:18:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B7EC919465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 18:18:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A4EAF2026D76; Fri, 25 Aug 2023 18:18:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D47F2026D68
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 18:18:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 625218D40A0
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 18:18:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-PLvJMWwYO2G8QZR8esvgsw-1; Fri, 25 Aug 2023 14:18:50 -0400
X-MC-Unique: PLvJMWwYO2G8QZR8esvgsw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 462A466CC0;
 Fri, 25 Aug 2023 18:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC86C433C8;
 Fri, 25 Aug 2023 18:18:47 +0000 (UTC)
Message-ID: <9a8ead64cdd32fdad29cae3aff0bd447f33a32c2.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Aring <aahringo@redhat.com>, linux-nfs@vger.kernel.org
Date: Fri, 25 Aug 2023 14:18:46 -0400
In-Reply-To: <20230823213352.1971009-7-aahringo@redhat.com>
References: <20230823213352.1971009-1-aahringo@redhat.com>
 <20230823213352.1971009-7-aahringo@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH 6/7] dlm: use FL_SLEEP to determine
 blocking vs non-blocking
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
Cc: cluster-devel@redhat.com, ocfs2-devel@lists.linux.dev,
 chuck.lever@oracle.com, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-08-23 at 17:33 -0400, Alexander Aring wrote:
> This patch uses the FL_SLEEP flag in struct file_lock to determine if
> the lock request is a blocking or non-blocking request. Before dlm was
> using IS_SETLKW() was being used which is not usable for lock requests
> coming from lockd when EXPORT_OP_SAFE_ASYNC_LOCK inside the export flags
> is set.
>=20
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/plock.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> index 0094fa4004cc..0c6ed5eeb840 100644
> --- a/fs/dlm/plock.c
> +++ b/fs/dlm/plock.c
> @@ -140,7 +140,7 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 nu=
mber, struct file *file,
>  =09op->info.optype=09=09=3D DLM_PLOCK_OP_LOCK;
>  =09op->info.pid=09=09=3D fl->fl_pid;
>  =09op->info.ex=09=09=3D (fl->fl_type =3D=3D F_WRLCK);
> -=09op->info.wait=09=09=3D IS_SETLKW(cmd);
> +=09op->info.wait=09=09=3D !!(fl->fl_flags & FL_SLEEP);
>  =09op->info.fsid=09=09=3D ls->ls_global_id;
>  =09op->info.number=09=09=3D number;
>  =09op->info.start=09=09=3D fl->fl_start;

Not sure you really need the !!, but ok...

Reviewed-by: Jeff Layton <jlayton@kernel.org>

