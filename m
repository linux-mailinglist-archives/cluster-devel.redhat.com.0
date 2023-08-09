Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B91776BEB
	for <lists+cluster-devel@lfdr.de>; Thu, 10 Aug 2023 00:07:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691618876;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TocOYez8bwieK0s++tvTK6sDoqRT6744eV7/mooCgdE=;
	b=SSM3J9xMC3aGRaAl2SSLkE4nN5XslDAl5mPJ4Zah1HjooOtCAMH+b1QWnlTg8Wt59M7T72
	5hFAdkqDrV0MNaXKlUKRpDLfv9MDF/Atc/8xPW6pluKOaeVOcn5G9+1nTOR+RWV5VPJXRN
	f4j/VQgz/Yc425OFR3Pbudy6Yq9zM5s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-v7xmxpYoO4qly-Y5aV_qLw-1; Wed, 09 Aug 2023 18:07:48 -0400
X-MC-Unique: v7xmxpYoO4qly-Y5aV_qLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E562185A78B;
	Wed,  9 Aug 2023 22:07:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E0C4140E96D;
	Wed,  9 Aug 2023 22:07:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9DEFD1946594;
	Wed,  9 Aug 2023 22:07:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D76291946588 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  9 Aug 2023 22:07:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B952940C2077; Wed,  9 Aug 2023 22:07:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1C2B40C2076
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 22:07:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9018E8DC664
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 22:07:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-rlKWtni5MKWUsu2vFfLFMg-1; Wed, 09 Aug 2023 18:07:39 -0400
X-MC-Unique: rlKWtni5MKWUsu2vFfLFMg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C164F6142A;
 Wed,  9 Aug 2023 22:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8A1FC433C8;
 Wed,  9 Aug 2023 22:07:30 +0000 (UTC)
Message-ID: <e4cee2590f5cb9a13a8d4445e550e155d551670d.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Frank Sorenson
 <sorenson@redhat.com>
Date: Wed, 09 Aug 2023 18:07:29 -0400
In-Reply-To: <87a5v06kij.fsf@mail.parknet.co.jp>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-5-d1dec143a704@kernel.org>
 <87msz08vc7.fsf@mail.parknet.co.jp>
 <52bead1d6a33fec89944b96e2ec20d1ea8747a9a.camel@kernel.org>
 <878rak8hia.fsf@mail.parknet.co.jp>
 <20230809150041.452w7gucjmvjnvbg@quack3>
 <87v8do6y8q.fsf@mail.parknet.co.jp>
 <2cb998ff14ace352a9dd553e82cfa0aa92ec09ce.camel@kernel.org>
 <87leek6rh1.fsf@mail.parknet.co.jp>
 <ccffe6ca3397c8374352b002fe01d55b09d84ef4.camel@kernel.org>
 <87h6p86p9z.fsf@mail.parknet.co.jp>
 <edf8e8ca3b38e56f30e0d24ac7293f848ffee371.camel@kernel.org>
 <87a5v06kij.fsf@mail.parknet.co.jp>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH v7 05/13] fat: make fat_update_time get
 its own timestamp
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Jan Kara <jack@suse.cz>, "Darrick
 J. Wong" <djwong@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, ecryptfs@vger.kernel.org,
 Yue Hu <huyue2@gl0jj8bn.sched.sma.tdnsstic1.cn>,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Hans de Goede <hdegoede@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, linux-xfs@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, linux-unionfs@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, coda@cs.cmu.edu, linux-mm@kvack.org,
 Ilya Dryomov <idryomov@gmail.com>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 codalist@telemann.coda.cs.cmu.edu, Shyam Prasad N <sprasad@microsoft.com>,
 Amir Goldstein <amir73il@gmail.com>, Kees Cook <keescook@chromium.org>,
 ocfs2-devel@lists.linux.dev, Chao Yu <chao@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Tejun Heo <tj@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Gao Xiang <xiang@kernel.org>,
 Jan Harkes <jaharkes@cs.cmu.edu>, Christian Brauner <brauner@kernel.org>,
 linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2023-08-10 at 05:14 +0900, OGAWA Hirofumi wrote:
> Jeff Layton <jlayton@kernel.org> writes:
>=20
> > When you say it "doesn't work the same", what do you mean, specifically=
?
> > I had to make some allowances for the fact that FAT is substantially
> > different in its timestamp handling, and I tried to preserve existing
> > behavior as best I could.
>=20
> Ah, ok. I was misreading some.
>=20
> inode_update_timestamps() checks IS_I_VERSION() now, not S_VERSION.  So,
> if adding the check of IS_I_VERSION() and (S_MTIME|S_CTIME|S_VERSION) to
> FAT?
>=20
> With it, IS_I_VERSION() would be false on FAT, and I'm fine.
>=20
> I.e. something like
>=20
> =09if ((flags & (S_VERSION|S_CTIME|S_MTIME)) && IS_I_VERSION(inode)
> =09    && inode_maybe_inc_iversion(inode, false))
>   =09=09dirty_flags |=3D I_DIRTY_SYNC;
>=20
> Thanks.

If you do that then the i_version counter would never be incremented.
But...I think I see what you're getting at.

Most filesystems that support the i_version counter have an on-disk
field for it. FAT obviously has no such thing. I suspect the i_version
bits in fat_update_time were added by mistake. FAT doesn't set
SB_I_VERSION so there's no need to do anything to the i_version field at
all.

Also, given that the mtime and ctime are always kept in sync on FAT,
we're probably fine to have it look something like this:

--------------------8<------------------
int fat_update_time(struct inode *inode, int flags)=20
{=20
        int dirty_flags =3D 0;

        if (inode->i_ino =3D=3D MSDOS_ROOT_INO)=20
                return 0;

        fat_truncate_time(inode, NULL, flags);
        if (inode->i_sb->s_flags & SB_LAZYTIME)
                dirty_flags |=3D I_DIRTY_TIME;
        else
                dirty_flags |=3D I_DIRTY_SYNC;

        __mark_inode_dirty(inode, dirty_flags);
        return 0;
}=20
--------------------8<------------------

...and we should probably do that in a separate patch in advance of the
update_time rework, since it's really a different change.

If you're in agreement, then I'll plan to respin the series with this
fixed and resend.

Thanks for being patient!
--=20
Jeff Layton <jlayton@kernel.org>

