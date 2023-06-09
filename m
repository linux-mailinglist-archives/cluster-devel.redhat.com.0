Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 90666729B93
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Jun 2023 15:27:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686317273;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=an16WKg86bh1KZ2zQGFucfRvsgqclYfYotC4p2/OS6Y=;
	b=MH8L1kmVk+sbtazJ52aiKo3QZUE0/AwFbLQvqEwwsKO+vzz4Zbcd+NSg02shQzC55eJiQY
	twoAQc+whj64zBPF9uemcGVhnfebB19dG6wSuRlZdHB2nTMVh+rtkdnVSm8VoRQ8X7GZQ7
	F0lRb5DHFYJaKHDBZMkTemm3//zORkc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-Pzx_xYCNNB-Uu7odX13o2A-1; Fri, 09 Jun 2023 09:27:50 -0400
X-MC-Unique: Pzx_xYCNNB-Uu7odX13o2A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5867A3850576;
	Fri,  9 Jun 2023 13:27:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1430A492B0A;
	Fri,  9 Jun 2023 13:27:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E93E019451C3;
	Fri,  9 Jun 2023 13:27:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4ABE0194658C for <cluster-devel@listman.corp.redhat.com>;
 Fri,  9 Jun 2023 13:27:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E9BCCC16044; Fri,  9 Jun 2023 13:27:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E287AC16046
 for <cluster-devel@redhat.com>; Fri,  9 Jun 2023 13:27:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C460E3C0F422
 for <cluster-devel@redhat.com>; Fri,  9 Jun 2023 13:27:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-r1BoSuoUMGmKw5G4wOsB1Q-1; Fri, 09 Jun 2023 09:27:42 -0400
X-MC-Unique: r1BoSuoUMGmKw5G4wOsB1Q-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0242D60E74;
 Fri,  9 Jun 2023 13:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7BCC433EF;
 Fri,  9 Jun 2023 13:27:37 +0000 (UTC)
Message-ID: <671ceeb2e019c11617a481739c2e17604456c48c.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 09 Jun 2023 09:27:36 -0400
In-Reply-To: <2023060931-magazine-nickname-f386@gregkh>
References: <20230609125023.399942-1-jlayton@kernel.org>
 <2023060931-magazine-nickname-f386@gregkh>
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH 0/9] fs: add some missing ctime updates
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
 linux-cifs@vger.kernel.org, Ritu Agarwal <rituagar@linux.ibm.com>,
 James Morris <jmorris@namei.org>, cluster-devel@redhat.com,
 Namjae Jeon <linkinjeon@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Arnd Bergmann <arnd@arndb.de>,
 autofs@vger.kernel.org, apparmor@lists.ubuntu.com, Tom Talpey <tom@talpey.com>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>, Paul Moore <paul@paul-moore.com>,
 Christian Brauner <brauner@kernel.org>,
 John Johansen <john.johansen@canonical.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 linux-security-module@vger.kernel.org, Jeremy Kerr <jk@ozlabs.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Brad Warrum <bwarrum@linux.ibm.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fri, 2023-06-09 at 15:10 +0200, Greg Kroah-Hartman wrote:
> On Fri, Jun 09, 2023 at 08:50:14AM -0400, Jeff Layton wrote:
> > While working on a patch series to change how we handle the ctime, I
> > found a number of places that update the mtime without a corresponding
> > ctime update. POSIX requires that when the mtime is updated that the
> > ctime also be updated.
> >=20
> > Note that these are largely untested other than for compilation, so
> > please review carefully. These are a preliminary set for the upcoming
> > rework of how we handle the ctime.
> >=20
> > None of these seem to be very crucial, but it would be nice if
> > various maintainers could pick these up for v6.5. Please let me know if
> > you do.
> >=20
> > Jeff Layton (9):
> >   ibmvmc: update ctime in conjunction with mtime on write
> >   usb: update the ctime as well when updating mtime after an ioctl
> >   autofs: set ctime as well when mtime changes on a dir
> >   bfs: update ctime in addition to mtime when adding entries
> >   efivarfs: update ctime when mtime changes on a write
> >   exfat: ensure that ctime is updated whenever the mtime is
> >   gfs2: update ctime when quota is updated
> >   apparmor: update ctime whenever the mtime changes on an inode
> >   cifs: update the ctime on a partial page write
> >=20
> >  drivers/misc/ibmvmc.c             |  2 +-
> >  drivers/usb/core/devio.c          | 16 ++++++++--------
> >  fs/autofs/root.c                  |  6 +++---
> >  fs/bfs/dir.c                      |  2 +-
> >  fs/efivarfs/file.c                |  2 +-
> >  fs/exfat/namei.c                  |  8 ++++----
> >  fs/gfs2/quota.c                   |  2 +-
> >  fs/smb/client/file.c              |  2 +-
> >  security/apparmor/apparmorfs.c    |  7 +++++--
> >  security/apparmor/policy_unpack.c | 11 +++++++----
> >  10 files changed, 32 insertions(+), 26 deletions(-)
> >=20
> > --=20
> > 2.40.1
> >=20
>=20
> All of these need commit log messages, didn't checkpatch warn you about
> that?

It did, once I ran it. ;)

I'll repost the set with more elaborate changelogs.
--=20
Jeff Layton <jlayton@kernel.org>

