Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A66776783
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Aug 2023 20:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691606313;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9EcmI8Rpl1R+tuyjPLJAOGmabIt197aKHT+nbD52Q1I=;
	b=JCxK07fCwPgksX+YDBUeCNX5Fr5iqCx9BhqYOP9sOg1p4JlsHYxcahkOKHWZnFxsP+f3AR
	byqskCb0dMvq9kf9rGM7fnUyupV2j7K6lwRsHJmrpfIub4LtOUT+jY8AYYIlgAzjG53jxG
	lpWagGd45k8dnoQEiD+43TFexN0dFL4=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-1z4YE5ATMUa50Raj1rI4UA-1; Wed, 09 Aug 2023 14:38:30 -0400
X-MC-Unique: 1z4YE5ATMUa50Raj1rI4UA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D8903811F4B;
	Wed,  9 Aug 2023 18:38:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C55B40C6E8A;
	Wed,  9 Aug 2023 18:38:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E46DC1946594;
	Wed,  9 Aug 2023 18:38:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F14281946588 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  9 Aug 2023 18:38:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BF88D1121315; Wed,  9 Aug 2023 18:38:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B758B1121314
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 18:38:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 990C21C07240
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 18:38:22 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-YHFPNMt1MOWFKF6bwasPJQ-1; Wed, 09 Aug 2023 14:38:18 -0400
X-MC-Unique: YHFPNMt1MOWFKF6bwasPJQ-1
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-40ffa784eaeso336561cf.0
 for <cluster-devel@redhat.com>; Wed, 09 Aug 2023 11:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691606298; x=1692211098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9EcmI8Rpl1R+tuyjPLJAOGmabIt197aKHT+nbD52Q1I=;
 b=J4oWqy87Lx4QjlzkJbTlHLfIASS8GrGV/lufKlAJ4+0H0OE4IT+Cq3YOFGGBfNCekR
 SHZ31NoMmMHRw1kVxXK5ewm2ppbGBnGoynYUXZu5gWh419KnqULcW+X4Tn94jxEttDom
 xdfHtvlczeLXZDh2iHVu2PZ0MklCe4O7u7sXNuzrlr32MaIUUhA6sbhn7J6thnGaEOev
 UAuBU+M8YIQQEgir3nniZIimYZ041dO9iiINLAsfN/P92+UVduZCF8YshViQcZ6/XQwj
 W76WTejmQ3ab4qtQIOSwz6O28TYl6xtER23mKwbHZyo989FYQUF1B/LtIpEoXUxD0FbR
 9KWA==
X-Gm-Message-State: AOJu0YzAAd4VT/40FCpdxvd96duIQYWij/EcNqVNSW6fSQWpAiwOeC7S
 xI2f7sDbSnBAH+NwVr6ddHtZFZJ2/C0Gl0wWHrpMhg==
X-Google-Smtp-Source: AGHT+IH2sTR1ARtIFCpkS6vqthNwZFelmGu0RmLRp1wcx6mBBfZ3SQAFevZE8DnhGTo57OILWEQYl9skWtT3uKB51ZE=
X-Received: by 2002:ac8:4e47:0:b0:3f9:c207:3123 with SMTP id
 e7-20020ac84e47000000b003f9c2073123mr166690qtw.45.1691606297822; Wed, 09 Aug
 2023 11:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-8-d1dec143a704@kernel.org>
 <20230809-segeln-pflaumen-460b81bd2d3a@brauner>
In-Reply-To: <20230809-segeln-pflaumen-460b81bd2d3a@brauner>
From: Mike Marshall <hubcap@omnibond.com>
Date: Wed, 9 Aug 2023 14:38:07 -0400
Message-ID: <CAOg9mST=WFAjEwS9eNi_huoUpBvPy3R3fbFVTLUeFZAv6BJEEQ@mail.gmail.com>
To: Christian Brauner <brauner@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH v7 08/13] fs: drop the timespec64
 argument from update_time
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
 linux-xfs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, ecryptfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 samba-technical@lists.samba.org, codalist@coda.cs.cmu.edu,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Eric Van Hensbergen <ericvh@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, coda@cs.cmu.edu, linux-mm@kvack.org,
 Ilya Dryomov <idryomov@gmail.com>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Amir Goldstein <amir73il@gmail.com>,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 Chao Yu <chao@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, Tejun Heo <tj@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: omnibond.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've been following this patch on fsdevel... is there a
remote I could fetch with a branch that has this in it?

-Mike

On Wed, Aug 9, 2023 at 8:32=E2=80=AFAM Christian Brauner <brauner@kernel.or=
g> wrote:
>
> On Mon, Aug 07, 2023 at 03:38:39PM -0400, Jeff Layton wrote:
> > Now that all of the update_time operations are prepared for it, we can
> > drop the timespec64 argument from the update_time operation. Do that an=
d
> > remove it from some associated functions like inode_update_time and
> > inode_needs_update_time.
> >
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  fs/bad_inode.c           |  3 +--
> >  fs/btrfs/inode.c         |  3 +--
> >  fs/btrfs/volumes.c       |  4 +---
> >  fs/fat/fat.h             |  3 +--
> >  fs/fat/misc.c            |  2 +-
> >  fs/gfs2/inode.c          |  3 +--
> >  fs/inode.c               | 30 +++++++++++++-----------------
> >  fs/overlayfs/inode.c     |  2 +-
> >  fs/overlayfs/overlayfs.h |  2 +-
> >  fs/ubifs/file.c          |  3 +--
> >  fs/ubifs/ubifs.h         |  2 +-
> >  fs/xfs/xfs_iops.c        |  1 -
> >  include/linux/fs.h       |  4 ++--
>
> This was missing the conversion of fs/orangefs orangefs_update_time()
> causing the build to fail. So at some point kbuild will yell here.
> Fwiw, I've fixed that up in-tree.

