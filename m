Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C30B1788E70
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Aug 2023 20:17:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692987473;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s4HOVuVeYQZN/moS0W9TFg4rNOYjnMcQKpOLeaLgkSE=;
	b=Ww+MqNVW0FrFKn9w0AwJGnvUwpwbixbaVB3OXL1CAiwlL28zC3OMSKshhX288f9QruPxwW
	z8IEp8hxlGarh7TgOfD7DU4GtTYMIeaitN9n0xIlupZd3eAK3XshX3tL6vpOdZJnq0iocc
	RDFhCHFKfVqVi3uDo2HBGcZeumafNUw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-s-e65RJEOJKJ_s0g8aO5dA-1; Fri, 25 Aug 2023 14:17:48 -0400
X-MC-Unique: s-e65RJEOJKJ_s0g8aO5dA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72E77855710;
	Fri, 25 Aug 2023 18:17:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64EF663A63;
	Fri, 25 Aug 2023 18:17:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3567319465B3;
	Fri, 25 Aug 2023 18:17:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6528A19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 18:17:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5552E140E962; Fri, 25 Aug 2023 18:17:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DFA1140E950
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 18:17:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16CD0800270
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 18:17:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-G6ld2QLCP1O3yf3iZb5cVA-1; Fri, 25 Aug 2023 14:17:42 -0400
X-MC-Unique: G6ld2QLCP1O3yf3iZb5cVA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A1A765975;
 Fri, 25 Aug 2023 18:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3ECC433C7;
 Fri, 25 Aug 2023 18:17:39 +0000 (UTC)
Message-ID: <66276fa17fbe7c9db536b636f5316b6b3a6d9829.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Aring <aahringo@redhat.com>, linux-nfs@vger.kernel.org
Date: Fri, 25 Aug 2023 14:17:38 -0400
In-Reply-To: <20230823213352.1971009-5-aahringo@redhat.com>
References: <20230823213352.1971009-1-aahringo@redhat.com>
 <20230823213352.1971009-5-aahringo@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 4/7] lockd: add doc to enable
 EXPORT_OP_SAFE_ASYNC_LOCK
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-08-23 at 17:33 -0400, Alexander Aring wrote:
> This patch adds a note to enable EXPORT_OP_SAFE_ASYNC_LOCK for
> asynchronous lock request handling.
>=20
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/locks.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/fs/locks.c b/fs/locks.c
> index df8b26a42524..edee02d1ca93 100644
> --- a/fs/locks.c
> +++ b/fs/locks.c
> @@ -2255,11 +2255,13 @@ int fcntl_getlk(struct file *filp, unsigned int c=
md, struct flock *flock)
>   * To avoid blocking kernel daemons, such as lockd, that need to acquire=
 POSIX
>   * locks, the ->lock() interface may return asynchronously, before the l=
ock has
>   * been granted or denied by the underlying filesystem, if (and only if)
> - * lm_grant is set. Callers expecting ->lock() to return asynchronously
> - * will only use F_SETLK, not F_SETLKW; they will set FL_SLEEP if (and o=
nly if)
> - * the request is for a blocking lock. When ->lock() does return asynchr=
onously,
> - * it must return FILE_LOCK_DEFERRED, and call ->lm_grant() when the loc=
k
> - * request completes.
> + * lm_grant is set. Additionally EXPORT_OP_SAFE_ASYNC_LOCK in export_ope=
rations
> + * flags need to be set.
> + *
> + * Callers expecting ->lock() to return asynchronously will only use F_S=
ETLK,
> + * not F_SETLKW; they will set FL_SLEEP if (and only if) the request is =
for a
> + * blocking lock. When ->lock() does return asynchronously, it must retu=
rn
> + * FILE_LOCK_DEFERRED, and call ->lm_grant() when the lock request compl=
etes.
>   * If the request is for non-blocking lock the file system should return
>   * FILE_LOCK_DEFERRED then try to get the lock and call the callback rou=
tine
>   * with the result. If the request timed out the callback routine will r=
eturn a

Reviewed-by: Jeff Layton <jlayton@kernel.org>

