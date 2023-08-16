Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E58A77E102
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Aug 2023 14:02:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692187361;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lsOx9Ym1Tggn3LoM0gbIUJiKTSMGLDL47Vdv+KfDbXc=;
	b=Bzjtxa3d2Ltzi0GuwKjXBwyqny6mFXez2wqbU2LJWBldiw1eLjPJ2E7pto6VN8y2do4JPv
	w0RsDdlm6ZVBw/RxSuIg2mRxyzYEF6QIhMt5Z5aPpu/1/mvo/+cr2EOTSHQQVu+Sa+5udV
	ReMSJHWFboTWq6N2oNDSMqrxDeDkU+w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-C0xaLMVUNTG1_o3UiG8fyA-1; Wed, 16 Aug 2023 08:02:35 -0400
X-MC-Unique: C0xaLMVUNTG1_o3UiG8fyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD3C285C70D;
	Wed, 16 Aug 2023 12:02:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6631EC15BBA;
	Wed, 16 Aug 2023 12:02:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2FBB8194658D;
	Wed, 16 Aug 2023 12:02:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 02F161946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 16 Aug 2023 12:01:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E7FCE6403D; Wed, 16 Aug 2023 12:01:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E01B363F6D
 for <cluster-devel@redhat.com>; Wed, 16 Aug 2023 12:01:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3BCD85C713
 for <cluster-devel@redhat.com>; Wed, 16 Aug 2023 12:01:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-pHr3RYYQMFmY4RPk38GTwA-1; Wed, 16 Aug 2023 08:01:09 -0400
X-MC-Unique: pHr3RYYQMFmY4RPk38GTwA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37A7160C71;
 Wed, 16 Aug 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D86C433C8;
 Wed, 16 Aug 2023 12:01:05 +0000 (UTC)
Message-ID: <ca18531b54306d27218daf8e90b72ef3a4b8e44f.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Aring <aahringo@redhat.com>, linux-nfs@vger.kernel.org
Date: Wed, 16 Aug 2023 08:01:04 -0400
In-Reply-To: <20230814211116.3224759-5-aahringo@redhat.com>
References: <20230814211116.3224759-1-aahringo@redhat.com>
 <20230814211116.3224759-5-aahringo@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [RFCv2 4/7] locks: update lock callback
 documentation
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-08-14 at 17:11 -0400, Alexander Aring wrote:
> This patch updates the existing documentation regarding recent changes
> to vfs_lock_file() and lm_grant() is set. In case of lm_grant() is set
> we only handle FILE_LOCK_DEFERRED in case of FL_SLEEP in fl_flags is not
> set. This is the case of an blocking lock request. Non-blocking lock
> requests, when FL_SLEEP is not set, are handled in a synchronized way.
>=20
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/locks.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/fs/locks.c b/fs/locks.c
> index df8b26a42524..a8e51f462b43 100644
> --- a/fs/locks.c
> +++ b/fs/locks.c
> @@ -2255,21 +2255,21 @@ int fcntl_getlk(struct file *filp, unsigned int c=
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
> - * If the request is for non-blocking lock the file system should return
> - * FILE_LOCK_DEFERRED then try to get the lock and call the callback rou=
tine
> - * with the result. If the request timed out the callback routine will r=
eturn a
> + * lm_grant and FL_SLEEP in fl_flags is set. Callers expecting ->lock() =
to return
> + * asynchronously will only use F_SETLK, not F_SETLKW; When ->lock() doe=
s return

Isn't the above backward? Shouldn't it say "Callers expecting ->lock()
to return asynchronously will only use F_SETLKW, not F_SETLK" ?

> + * asynchronously, it must return FILE_LOCK_DEFERRED, and call ->lm_gran=
t() when
> + * the lock request completes. The lm_grant() callback must be called in=
 a
> + * sleepable context.
> + *
> + * If the request timed out the ->lm_grant() callback routine will retur=
n a
>   * nonzero return code and the file system should release the lock. The =
file
> - * system is also responsible to keep a corresponding posix lock when it
> - * grants a lock so the VFS can find out which locks are locally held an=
d do
> - * the correct lock cleanup when required.
> - * The underlying filesystem must not drop the kernel lock or call
> - * ->lm_grant() before returning to the caller with a FILE_LOCK_DEFERRED
> - * return code.
> + * system is also responsible to keep a corresponding posix lock when it=
 grants
> + * a lock so the VFS can find out which locks are locally held and do th=
e correct
> + * lock cleanup when required.
> + *
> + * If the request is for non-blocking lock (when F_SETLK and FL_SLEEP in=
 fl_flags is not set)
> + * the file system should return -EAGAIN if failed to acquire or zero if=
 acquiring was
> + * successfully without calling the ->lm_grant() callback routine.
>   */
>  int vfs_lock_file(struct file *filp, unsigned int cmd, struct file_lock =
*fl, struct file_lock *conf)
>  {

--=20
Jeff Layton <jlayton@kernel.org>

