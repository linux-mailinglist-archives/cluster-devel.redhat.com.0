Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CCC72A073
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Jun 2023 18:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686329100;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lP5O6Y+WWlbHJraaUNqLEu0298uTs2XTBNqgvHhDjHo=;
	b=hffcD7ficCpSlcWw0dNi1w3ZYoTU8fk/zhsOrOxcC9VN6ujZY6IyF7OXBOzib6Uy8ZG8w8
	8zCeNokSs8pvPJ5wU/+ayl3zf+lledeGpN78irbgafJfT4r9azrwSV+uO5YvD2/a/pHsqv
	2+9vv8hJ7kbySWGc987TbC81zrGZke8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-3ChG4MYXPECev20SdlUDPg-1; Fri, 09 Jun 2023 12:44:59 -0400
X-MC-Unique: 3ChG4MYXPECev20SdlUDPg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60E83811E8F;
	Fri,  9 Jun 2023 16:44:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14D5F1121314;
	Fri,  9 Jun 2023 16:44:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A988919451C3;
	Fri,  9 Jun 2023 16:44:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 79F77194658C for <cluster-devel@listman.corp.redhat.com>;
 Fri,  9 Jun 2023 16:44:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 64F99492B00; Fri,  9 Jun 2023 16:44:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CF0E48205E
 for <cluster-devel@redhat.com>; Fri,  9 Jun 2023 16:44:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C47C8037AD
 for <cluster-devel@redhat.com>; Fri,  9 Jun 2023 16:44:55 +0000 (UTC)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-sl-gOaQfPZGgbLrMYpukdw-1; Fri, 09 Jun 2023 12:44:53 -0400
X-MC-Unique: sl-gOaQfPZGgbLrMYpukdw-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1b1bc451303so6800535ad.1
 for <cluster-devel@redhat.com>; Fri, 09 Jun 2023 09:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686329093; x=1688921093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lP5O6Y+WWlbHJraaUNqLEu0298uTs2XTBNqgvHhDjHo=;
 b=UIMVVo3acY/E1Cl3nen86lZED+vKGe7xF2qJGy4MGhTfiV4zsV/tZ2JnDglrtbtxMh
 MJJDMHri4SRRn7IBV572hl2d6m3fv4G7IfweNFkxPzunkO4Z4EynTfsjy0SX3nlyPHbc
 XuCGRUSEz1bHC3wSEf2pGfh9CTlC8yXkKAOIU522hk/sOOIuDOaDqNhI23PwtO1Wb9an
 yuQIxxJzA+PR3qHXstXpaN1Ryo0R2oCImCq1m45ZOoxZcL7nef37WJlWigzibYYBZi3C
 v1sC8kg/XFswTDY/PtUaQvmAStKquJQAYf/kFm06TTiUiIlhwRPufnxQ1r9mE6oTPl5w
 88GA==
X-Gm-Message-State: AC+VfDy61rEWDABXDq+IJE3Bx8SB0v2saCOdCzdaoWwgkhCw+bB4YzuM
 J6Lg3ePTY98G5LcaFqSDCnavciV4TV9gxsATZJF25UWCVS6ao5ZQuQclpnMk5SFPhdKddR8sWUH
 U89nJTkzUb9aX0CSEyq8Q21UN5EpjFQBwrXhqwg==
X-Received: by 2002:a17:902:b905:b0:1af:e63f:5bb1 with SMTP id
 bf5-20020a170902b90500b001afe63f5bb1mr1282634plb.7.1686329092969; 
 Fri, 09 Jun 2023 09:44:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7zDVq695OK7McLR4vzNBftl0R3SL21TRjXzZOuBBU36wjdeP/MVpNAkO6JcixIuhfY6AAHiytBnKwzWzUI7o8=
X-Received: by 2002:a17:902:b905:b0:1af:e63f:5bb1 with SMTP id
 bf5-20020a170902b90500b001afe63f5bb1mr1282622plb.7.1686329092671; Fri, 09 Jun
 2023 09:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230609125023.399942-1-jlayton@kernel.org>
 <20230609125023.399942-8-jlayton@kernel.org>
In-Reply-To: <20230609125023.399942-8-jlayton@kernel.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 9 Jun 2023 18:44:41 +0200
Message-ID: <CAHc6FU4wyfQT7T75j2Sd9WNp=ag7hpDZGYkR=m73h2nOaH+AqQ@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jeff,

On Fri, Jun 9, 2023 at 2:50=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wro=
te:
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/gfs2/quota.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> index 1ed17226d9ed..6d283e071b90 100644
> --- a/fs/gfs2/quota.c
> +++ b/fs/gfs2/quota.c
> @@ -869,7 +869,7 @@ static int gfs2_adjust_quota(struct gfs2_inode *ip, l=
off_t loc,
>                 size =3D loc + sizeof(struct gfs2_quota);
>                 if (size > inode->i_size)
>                         i_size_write(inode, size);
> -               inode->i_mtime =3D inode->i_atime =3D current_time(inode)=
;
> +               inode->i_mtime =3D inode->i_atime =3D inode->i_ctime =3D =
current_time(inode);

I don't think we need to worry about the ctime of the quota inode as
that inode is internal to the filesystem only.

>                 mark_inode_dirty(inode);
>                 set_bit(QDF_REFRESH, &qd->qd_flags);
>         }
> --
> 2.40.1
>

Thanks,
Andreas

