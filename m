Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F546749029
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Jul 2023 23:48:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688593722;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fjEypqX3nmfXsQhKnncBC2ATKOwiEVIpHqBcuYS07OE=;
	b=WDzvLA/nE+Vq509hn1ReJ57NcGpDdJmU1pvs0NoQyNkCWiJDznesKCQyKAEGvz21BeQ1Ql
	dKjlftTSMxH8m+1lBcM/aPGPyly7apxTv/tG6XUMYMgtxQowgrvg8sBAdQuMT6D1MCa0ZU
	g+en1c8Xfna1wslnahRGd0ZiH1zu2IU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-sxAbnSwfPUewwb3DHVfK-g-1; Wed, 05 Jul 2023 17:48:39 -0400
X-MC-Unique: sxAbnSwfPUewwb3DHVfK-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48CF385A58A;
	Wed,  5 Jul 2023 21:48:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC23218EB4;
	Wed,  5 Jul 2023 21:48:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8BEC7194658F;
	Wed,  5 Jul 2023 21:48:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9EF6A1946588 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Jul 2023 21:48:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8E59C4CD0CA; Wed,  5 Jul 2023 21:48:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 873754CD0C8
 for <cluster-devel@redhat.com>; Wed,  5 Jul 2023 21:48:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C47A1C04326
 for <cluster-devel@redhat.com>; Wed,  5 Jul 2023 21:48:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-4xDXDD69PDOHNd9nZUh6Xw-1; Wed, 05 Jul 2023 17:48:30 -0400
X-MC-Unique: 4xDXDD69PDOHNd9nZUh6Xw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1F9761775;
 Wed,  5 Jul 2023 21:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E78C433C7;
 Wed,  5 Jul 2023 21:48:26 +0000 (UTC)
Message-ID: <9711e5f19dd2c040b4105147129a8db0aaf94b53.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 05 Jul 2023 17:48:24 -0400
In-Reply-To: <CAHc6FU54Gh+5hovqXZZSADqym=VCMis-EH9sKhAjgjXD6MUtqw@mail.gmail.com>
References: <20230609125023.399942-1-jlayton@kernel.org>
 <20230609125023.399942-8-jlayton@kernel.org>
 <CAHc6FU4wyfQT7T75j2Sd9WNp=ag7hpDZGYkR=m73h2nOaH+AqQ@mail.gmail.com>
 <a1f7a725186082d933aff702d1d50c6456da6f20.camel@kernel.org>
 <CAHc6FU54Gh+5hovqXZZSADqym=VCMis-EH9sKhAjgjXD6MUtqw@mail.gmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-07-05 at 22:25 +0200, Andreas Gruenbacher wrote:
> On Mon, Jun 12, 2023 at 12:36=E2=80=AFPM Jeff Layton <jlayton@kernel.org>=
 wrote:
> > On Fri, 2023-06-09 at 18:44 +0200, Andreas Gruenbacher wrote:
> > > Jeff,
> > >=20
> > > On Fri, Jun 9, 2023 at 2:50=E2=80=AFPM Jeff Layton <jlayton@kernel.or=
g> wrote:
> > > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > > ---
> > > >  fs/gfs2/quota.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> > > > index 1ed17226d9ed..6d283e071b90 100644
> > > > --- a/fs/gfs2/quota.c
> > > > +++ b/fs/gfs2/quota.c
> > > > @@ -869,7 +869,7 @@ static int gfs2_adjust_quota(struct gfs2_inode =
*ip, loff_t loc,
> > > >                 size =3D loc + sizeof(struct gfs2_quota);
> > > >                 if (size > inode->i_size)
> > > >                         i_size_write(inode, size);
> > > > -               inode->i_mtime =3D inode->i_atime =3D current_time(=
inode);
> > > > +               inode->i_mtime =3D inode->i_atime =3D inode->i_ctim=
e =3D current_time(inode);
> > >=20
> > > I don't think we need to worry about the ctime of the quota inode as
> > > that inode is internal to the filesystem only.
> > >=20
> >=20
> > Thanks Andreas.  I'll plan to drop this patch from the series for now.
> >=20
> > Does updating the mtime and atime here serve any purpose, or should
> > those also be removed? If you plan to keep the a/mtime updates then I'd
> > still suggest updating the ctime for consistency's sake. It shouldn't
> > cost anything extra to do so since you're dirtying the inode below
> > anyway.
>=20
> Yes, good point actually, we should keep things consistent for simplicity=
.
>=20
> Would you add this back in if you do another posting?
>=20

I just re-posted the other patches in this as part of the ctime accessor
conversion. If I post again though, I can resurrect the gfs2 patch.=C2=A0If
not, we can do a follow-on fix later.

Since we're discussing it, it may be more correct to remove the atime
update there. gfs2_adjust_quota sounds like a "modify" operation, not a
"read", so I don't see a reason to update the atime.

In general, the only time you only want to set the atime, ctime and
mtime in lockstep is when the inode is brand new.
--=20
Jeff Layton <jlayton@kernel.org>

