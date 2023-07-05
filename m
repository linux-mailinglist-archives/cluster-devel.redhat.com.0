Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B79749190
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Jul 2023 01:20:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688599200;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Qvm/ESewbN0H2Rkg9On6IkqD7SWtNhnTUlvYjg/d9JA=;
	b=blZV8lrIs0dlDT3JiQCJLovWe5oKf0oMSCrAXRJnOMXVcs8orPKnenEadbVJxM4iKCrOEK
	9ie1is2nb7knaAmzwXJKNYxyNzZDn9N8v/Fs0W3cqeHlcBzeRTl/ZmvV20uh+a/KTiu8bL
	b1AlsJptO7SWbHOAWbc4CM5dgV9PDVk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-eedHNaFoMCa73oR-belc9A-1; Wed, 05 Jul 2023 19:19:54 -0400
X-MC-Unique: eedHNaFoMCa73oR-belc9A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5F308030AC;
	Wed,  5 Jul 2023 23:19:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9759492C13;
	Wed,  5 Jul 2023 23:19:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6E312194658F;
	Wed,  5 Jul 2023 23:19:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8047B1946588 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Jul 2023 23:19:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6AAB84CD0C8; Wed,  5 Jul 2023 23:19:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63A61492C13
 for <cluster-devel@redhat.com>; Wed,  5 Jul 2023 23:19:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 455552A59571
 for <cluster-devel@redhat.com>; Wed,  5 Jul 2023 23:19:52 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-5bd5Uv0aNNef4MR7aNEBXg-1; Wed, 05 Jul 2023 19:19:47 -0400
X-MC-Unique: 5bd5Uv0aNNef4MR7aNEBXg-1
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2b703c900e3so287801fa.1; 
 Wed, 05 Jul 2023 16:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688599185; x=1691191185;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qvm/ESewbN0H2Rkg9On6IkqD7SWtNhnTUlvYjg/d9JA=;
 b=gtTABq+CMNiTUcTBicuofSlOX+HMdg+mOidcya3BoZB3K84wvcUxqqEOOlTDLV+joK
 x7baj/MxZCrU1tLhwzXBAfxiZse/SDfh3SCJOr91taf9usObGjMv0bI2eFxgbfYV5znh
 5OCL4miw5kHY2BYRrcLDOw9V7OQV2SA6VeLEqoJHHIo1YQN8XWXdN1MjNtoM0VloW4OM
 Mmmvj9/Ygg3j9yqb4dhSXHiICx4+PE2cbIKO7Gks+jF2m2TPPWCNw/TH/uX8+8pwz9NX
 EKRlpGLno+FKWEaJlM38FCtJ5nM4emeQw3DQ9Zc7TpiNviMP2hjDqLMlfOKVFsU79IHU
 8cfg==
X-Gm-Message-State: ABy/qLaQ0DbHMhJqF93cbCJARPFUufxUXA5Lut2Mqmam1YhuXXBocLNp
 SMMJCkwU34AJzHLquRb1owEXCDJOItiywvq3iw61vDAq7LwnRQ==
X-Google-Smtp-Source: APBJJlELm51lB9I+2X7mnELiIo/3gyycTB0nOTJa7gdmrmQA0kycn716CHsgpSj/cHth9HPURMsqR6Dsm4KUn5EZang=
X-Received: by 2002:a2e:9104:0:b0:2b6:f85a:20b0 with SMTP id
 m4-20020a2e9104000000b002b6f85a20b0mr111615ljg.16.1688599184905; Wed, 05 Jul
 2023 16:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230609125023.399942-1-jlayton@kernel.org>
 <20230609125023.399942-8-jlayton@kernel.org>
 <CAHc6FU4wyfQT7T75j2Sd9WNp=ag7hpDZGYkR=m73h2nOaH+AqQ@mail.gmail.com>
 <a1f7a725186082d933aff702d1d50c6456da6f20.camel@kernel.org>
 <CAHc6FU54Gh+5hovqXZZSADqym=VCMis-EH9sKhAjgjXD6MUtqw@mail.gmail.com>
 <9711e5f19dd2c040b4105147129a8db0aaf94b53.camel@kernel.org>
In-Reply-To: <9711e5f19dd2c040b4105147129a8db0aaf94b53.camel@kernel.org>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Thu, 6 Jul 2023 01:19:33 +0200
Message-ID: <CAHpGcMJriZRgwHL1yVJG9KkSwoDs9knnNRhakYN3GiuXPRkYOA@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 7/9] gfs2: update ctime when quota is
 updated
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
Cc: linux-efi@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Ruihan Li <lrh2000@pku.edu.cn>, Ard Biesheuvel <ardb@kernel.org>,
 Ian Kent <raven@themaw.net>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Ritu Agarwal <rituagar@linux.ibm.com>, James Morris <jmorris@namei.org>,
 cluster-devel@redhat.com, Namjae Jeon <linkinjeon@kernel.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Arnd Bergmann <arnd@arndb.de>, autofs@vger.kernel.org,
 apparmor@lists.ubuntu.com, Tom Talpey <tom@talpey.com>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 John Johansen <john.johansen@canonical.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 linux-security-module@vger.kernel.org, Jeremy Kerr <jk@ozlabs.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Brad Warrum <bwarrum@linux.ibm.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mi., 5. Juli 2023 um 23:51 Uhr schrieb Jeff Layton <jlayton@kernel.org>:
>
> On Wed, 2023-07-05 at 22:25 +0200, Andreas Gruenbacher wrote:
> > On Mon, Jun 12, 2023 at 12:36=E2=80=AFPM Jeff Layton <jlayton@kernel.or=
g> wrote:
> > > On Fri, 2023-06-09 at 18:44 +0200, Andreas Gruenbacher wrote:
> > > > Jeff,
> > > >
> > > > On Fri, Jun 9, 2023 at 2:50=E2=80=AFPM Jeff Layton <jlayton@kernel.=
org> wrote:
> > > > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > > > ---
> > > > >  fs/gfs2/quota.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> > > > > index 1ed17226d9ed..6d283e071b90 100644
> > > > > --- a/fs/gfs2/quota.c
> > > > > +++ b/fs/gfs2/quota.c
> > > > > @@ -869,7 +869,7 @@ static int gfs2_adjust_quota(struct gfs2_inod=
e *ip, loff_t loc,
> > > > >                 size =3D loc + sizeof(struct gfs2_quota);
> > > > >                 if (size > inode->i_size)
> > > > >                         i_size_write(inode, size);
> > > > > -               inode->i_mtime =3D inode->i_atime =3D current_tim=
e(inode);
> > > > > +               inode->i_mtime =3D inode->i_atime =3D inode->i_ct=
ime =3D current_time(inode);
> > > >
> > > > I don't think we need to worry about the ctime of the quota inode a=
s
> > > > that inode is internal to the filesystem only.
> > > >
> > >
> > > Thanks Andreas.  I'll plan to drop this patch from the series for now=
.
> > >
> > > Does updating the mtime and atime here serve any purpose, or should
> > > those also be removed? If you plan to keep the a/mtime updates then I=
'd
> > > still suggest updating the ctime for consistency's sake. It shouldn't
> > > cost anything extra to do so since you're dirtying the inode below
> > > anyway.
> >
> > Yes, good point actually, we should keep things consistent for simplici=
ty.
> >
> > Would you add this back in if you do another posting?
> >
>
> I just re-posted the other patches in this as part of the ctime accessor
> conversion. If I post again though, I can resurrect the gfs2 patch. If
> not, we can do a follow-on fix later.

Sure, not a big deal.

> Since we're discussing it, it may be more correct to remove the atime
> update there. gfs2_adjust_quota sounds like a "modify" operation, not a
> "read", so I don't see a reason to update the atime.
>
> In general, the only time you only want to set the atime, ctime and
> mtime in lockstep is when the inode is brand new.

Yes, that makes sense, too.

Thanks,
Andreas

