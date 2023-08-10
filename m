Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FADE778230
	for <lists+cluster-devel@lfdr.de>; Thu, 10 Aug 2023 22:32:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691699560;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HqygJpPikOyXm/wHwFtZNHvPApi5DlCiSAoJ4H1J1qM=;
	b=cE63VnU/54SUcRF1GqGCknNl3kDpeVOJUNV0Zb2pR+BXQDY75qzAS/tOn0n7GlouV0frgi
	lV+EA6Zc+LeMq5kogk66edV3haUhmjs91kLz5dQNsoeX2gO/guyu5wV1vzWwThlajTKC0j
	ZXuhBtIRuqjrgphaVeXar5mql31xwAA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-mRJf6YB2M7KfPmg3leHJfw-1; Thu, 10 Aug 2023 16:32:36 -0400
X-MC-Unique: mRJf6YB2M7KfPmg3leHJfw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05F6F8DC660;
	Thu, 10 Aug 2023 20:32:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F5371121314;
	Thu, 10 Aug 2023 20:32:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 52D511946595;
	Thu, 10 Aug 2023 20:32:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0153F1946588 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 10 Aug 2023 20:32:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D24E840C2077; Thu, 10 Aug 2023 20:32:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB56640C2076
 for <cluster-devel@redhat.com>; Thu, 10 Aug 2023 20:32:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97ABD185A791
 for <cluster-devel@redhat.com>; Thu, 10 Aug 2023 20:32:32 +0000 (UTC)
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-pi365sqgPr25iQwajL-xDA-1; Thu, 10 Aug 2023 16:25:15 -0400
X-MC-Unique: pi365sqgPr25iQwajL-xDA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4fe55c417fcso1283754e87.0
 for <cluster-devel@redhat.com>; Thu, 10 Aug 2023 13:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691699083; x=1692303883;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HqygJpPikOyXm/wHwFtZNHvPApi5DlCiSAoJ4H1J1qM=;
 b=BszYoiUhm2wN4IAjfGjK/dF9YYFEzwQlGWaKtabrC8OYYhyaQTdoOAoocwi1oX+/8u
 /vaJlvepBKWanRywa3sTy3OQ5XX1Q0Kb0CGnTCdKN258CwYsVEyPM9nxnNbfXceGX24J
 8eM5yvQhfYWOKRenPg8d4X8iw9dALPmE7zsNoX+r/rw7tf38WDP40YHGM1L71zF0phm/
 fIuCkJ1GI+8rMZKRMoL6TKILU3G9/VxIZMwVo3wyNSSNhTIkzGZdr3XhW+3A5PEk2Ey/
 7A8q/SwsCxH0L06Y1tk9HHAGddnFulfuZ9JoQeEYCPfAhD/Djnx4qNvsV9YpQ3HjvLsW
 MtrA==
X-Gm-Message-State: AOJu0YwjAzFDWvsvG7GJpWbV8/DN7xzk+KsDMd76EARGlmM5erkQ6yeH
 0YgSEYcTU99LfowTag1dNB56gk12nFg41L5ixJlTJqTkpufmdsbs9EFXggRDNKARNPLMVgodTwC
 9otokc7qi7zjFrRBzDEigRmgc5S9vLyKAxVTE0w==
X-Received: by 2002:a19:644e:0:b0:4fe:ef9:c8d0 with SMTP id
 b14-20020a19644e000000b004fe0ef9c8d0mr2399106lfj.35.1691699082929; 
 Thu, 10 Aug 2023 13:24:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4snsAYYAxitJ3kstAcmF6iy3hfrvRNaBhVUSfukWe/rN8pyfG+Rc91yAMi71zKGXU1Y4xobOMUc+21Uza6gA=
X-Received: by 2002:a19:644e:0:b0:4fe:ef9:c8d0 with SMTP id
 b14-20020a19644e000000b004fe0ef9c8d0mr2399086lfj.35.1691699082596; Thu, 10
 Aug 2023 13:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230720125806.1385279-1-aahringo@redhat.com>
 <20230720125806.1385279-3-aahringo@redhat.com>
 <fc5c5e0bcfa7110282106c3319af6a0b5a63b221.camel@kernel.org>
In-Reply-To: <fc5c5e0bcfa7110282106c3319af6a0b5a63b221.camel@kernel.org>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 10 Aug 2023 16:24:31 -0400
Message-ID: <CAK-6q+g4LiMixBe_U7o9sVxdz9i4FjXJ2XpBW-1JzrZ3WjkRCw@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [RFC v6.5-rc2 3/3] fs: lockd: introduce safe
 async lock op
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
Cc: cluster-devel@redhat.com, linux-nfs@vger.kernel.org, neilb@suse.de,
 Dai.Ngo@oracle.com, tom@talpey.com, kolga@netapp.com, chuck.lever@oracle.com,
 anna@kernel.org, trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 21, 2023 at 1:46=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> On Thu, 2023-07-20 at 08:58 -0400, Alexander Aring wrote:
> > This patch reverts mostly commit 40595cdc93ed ("nfs: block notification
> > on fs with its own ->lock") and introduces an EXPORT_OP_SAFE_ASYNC_LOCK
> > export flag to signal that the "own ->lock" implementation supports
> > async lock requests. The only main user is DLM that is used by GFS2 and
> > OCFS2 filesystem. Those implement their own lock() implementation and
> > return FILE_LOCK_DEFERRED as return value. Since commit 40595cdc93ed
> > ("nfs: block notification on fs with its own ->lock") the DLM
> > implementation were never updated. This patch should prepare for DLM
> > to set the EXPORT_OP_SAFE_ASYNC_LOCK export flag and update the DLM
> > plock implementation regarding to it.
> >
> > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > ---
> >  fs/lockd/svclock.c       |  5 ++---
> >  fs/nfsd/nfs4state.c      | 11 ++++++++---
> >  include/linux/exportfs.h |  1 +
> >  3 files changed, 11 insertions(+), 6 deletions(-)
> >
> > diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> > index 62ef27a69a9e..54a67bd33843 100644
> > --- a/fs/lockd/svclock.c
> > +++ b/fs/lockd/svclock.c
> > @@ -483,9 +483,7 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file=
 *file,
> >           struct nlm_host *host, struct nlm_lock *lock, int wait,
> >           struct nlm_cookie *cookie, int reclaim)
> >  {
> > -#if IS_ENABLED(CONFIG_SUNRPC_DEBUG)
> >       struct inode            *inode =3D nlmsvc_file_inode(file);
> > -#endif
> >       struct nlm_block        *block =3D NULL;
> >       int                     error;
> >       int                     mode;
> > @@ -499,7 +497,8 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file=
 *file,
> >                               (long long)lock->fl.fl_end,
> >                               wait);
> >
> > -     if (nlmsvc_file_file(file)->f_op->lock) {
> > +     if (!(inode->i_sb->s_export_op->flags & EXPORT_OP_SAFE_ASYNC_LOCK=
) &&
> > +         nlmsvc_file_file(file)->f_op->lock) {
> >               async_block =3D wait;
> >               wait =3D 0;
> >       }
> > diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
> > index 6e61fa3acaf1..efcea229d640 100644
> > --- a/fs/nfsd/nfs4state.c
> > +++ b/fs/nfsd/nfs4state.c
> > @@ -7432,6 +7432,7 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_c=
ompound_state *cstate,
> >       struct nfsd4_blocked_lock *nbl =3D NULL;
> >       struct file_lock *file_lock =3D NULL;
> >       struct file_lock *conflock =3D NULL;
> > +     struct super_block *sb;
> >       __be32 status =3D 0;
> >       int lkflg;
> >       int err;
> > @@ -7453,6 +7454,7 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_c=
ompound_state *cstate,
> >               dprintk("NFSD: nfsd4_lock: permission denied!\n");
> >               return status;
> >       }
> > +     sb =3D cstate->current_fh.fh_dentry->d_sb;
> >
> >       if (lock->lk_is_new) {
> >               if (nfsd4_has_session(cstate))
> > @@ -7504,7 +7506,8 @@ nfsd4_lock(struct svc_rqst *rqstp, struct nfsd4_c=
ompound_state *cstate,
> >       fp =3D lock_stp->st_stid.sc_file;
> >       switch (lock->lk_type) {
> >               case NFS4_READW_LT:
> > -                     if (nfsd4_has_session(cstate))
> > +                     if (sb->s_export_op->flags & EXPORT_OP_SAFE_ASYNC=
_LOCK &&
>
> This will break existing filesystems that don't set the new flag. Maybe
> you also need to test for the filesystem's ->lock operation here too?
>

yes.

> This might be more nicely expressed in a helper function.

ok.

- Alex

