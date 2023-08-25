Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 12090788E3C
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Aug 2023 20:10:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692987050;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ueUk52+CG34vSpcT+9QxRKezlikuAXjG97w43XvaUBM=;
	b=XN2L9rYHbdSf2uJfqBpHmf1lePUqv3eZFHCTjTjCEvWwd+pNxIvaJwkVSYLDVN/prMK5oJ
	WbWYDxny9xleTviwfIx+w6c47FpVXsvaCoIRdwS92cqCJJPbzPkFhVs92zmkwPoO/jWAo5
	QVD9YEX4SKmmdUl8q0NO5sgeZlzigqk=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-4CPbtr8zMTeuaBo3GxQkfw-1; Fri, 25 Aug 2023 14:10:43 -0400
X-MC-Unique: 4CPbtr8zMTeuaBo3GxQkfw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A5213C0CEE3;
	Fri, 25 Aug 2023 18:10:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A938440C2073;
	Fri, 25 Aug 2023 18:10:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5BBC919465B3;
	Fri, 25 Aug 2023 18:10:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 52D5C19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 18:10:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 21B69492C18; Fri, 25 Aug 2023 18:10:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19FEB492C14
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 18:10:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E925A185A791
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 18:10:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-AHdO5VPNOTK-EzuU2utHTw-1; Fri, 25 Aug 2023 14:10:35 -0400
X-MC-Unique: AHdO5VPNOTK-EzuU2utHTw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC06061943;
 Fri, 25 Aug 2023 18:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F13C433C7;
 Fri, 25 Aug 2023 18:10:32 +0000 (UTC)
Message-ID: <ae36349af354dcf40c29ff1c6bf7d930f08e7115.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Aring <aahringo@redhat.com>, linux-nfs@vger.kernel.org
Date: Fri, 25 Aug 2023 14:10:30 -0400
In-Reply-To: <20230823213352.1971009-3-aahringo@redhat.com>
References: <20230823213352.1971009-1-aahringo@redhat.com>
 <20230823213352.1971009-3-aahringo@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH 2/7] lockd: don't call vfs_lock_file()
 for pending requests
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-08-23 at 17:33 -0400, Alexander Aring wrote:
> This patch returns nlm_lck_blocked in nlmsvc_lock() when an asynchronous
> lock request is pending. During testing I ran into the case with the
> side-effects that lockd is waiting for only one lm_grant() callback
> because it's already part of the nlm_blocked list. If another
> asynchronous for the same nlm_block is triggered two lm_grant()
> callbacks will occur but lockd was only waiting for one.
>=20
> To avoid any change of existing users this handling will only being made
> when export_op_support_safe_async_lock() returns true.
>=20
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/lockd/svclock.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>=20
> diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> index 6e3b230e8317..aa4174fbaf5b 100644
> --- a/fs/lockd/svclock.c
> +++ b/fs/lockd/svclock.c
> @@ -531,6 +531,23 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file =
*file,
>  =09=09goto out;
>  =09}
> =20
> +=09spin_lock(&nlm_blocked_lock);
> +=09/*
> +=09 * If this is a lock request for an already pending
> +=09 * lock request we return nlm_lck_blocked without calling
> +=09 * vfs_lock_file() again. Otherwise we have two pending
> +=09 * requests on the underlaying ->lock() implementation but
> +=09 * only one nlm_block to being granted by lm_grant().
> +=09 */
> +=09if (export_op_support_safe_async_lock(inode->i_sb->s_export_op,
> +=09=09=09=09=09      nlmsvc_file_file(file)->f_op) &&
> +=09    !list_empty(&block->b_list)) {
> +=09=09spin_unlock(&nlm_blocked_lock);
> +=09=09ret =3D nlm_lck_blocked;
> +=09=09goto out;
> +=09}

Looks reasonable. The block->b_list check is subtle, but the comment
helps.

> +=09spin_unlock(&nlm_blocked_lock);
> +
>  =09if (!wait)
>  =09=09lock->fl.fl_flags &=3D ~FL_SLEEP;
>  =09mode =3D lock_to_openmode(&lock->fl);
> @@ -543,13 +560,6 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file =
*file,
>  =09=09=09ret =3D nlm_granted;
>  =09=09=09goto out;
>  =09=09case -EAGAIN:
> -=09=09=09/*
> -=09=09=09 * If this is a blocking request for an
> -=09=09=09 * already pending lock request then we need
> -=09=09=09 * to put it back on lockd's block list
> -=09=09=09 */
> -=09=09=09if (wait)
> -=09=09=09=09break;
>  =09=09=09ret =3D async_block ? nlm_lck_blocked : nlm_lck_denied;
>  =09=09=09goto out;
>  =09=09case FILE_LOCK_DEFERRED:


Reviewed-by: Jeff Layton <jlayton@kernel.org>

