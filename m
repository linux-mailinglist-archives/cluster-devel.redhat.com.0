Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 818507762D7
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Aug 2023 16:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691592300;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=MOCsRKWVFDQ5+8K52e1Kw/ijj3OYX5HbMPhfQsu89XE=;
	b=Y3lxkHjky70guiZHjULpYF3JOoky4EH4ie2oTs6n1zgrThRnlia8tBB1flUknFYgKXllr/
	8NIlml9t/TnlJH7/Ui+NxnSRUhGhwW9Xjo8Hot8rSbrw1YYeJ6/qT1XV4R8EXruUSFBBVH
	rEUsFokU8uLpOS1P+bwUBNkwT99nsXg=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-690-Q6gDIZlPMXy2PuTlGkZtMg-1; Wed, 09 Aug 2023 10:44:56 -0400
X-MC-Unique: Q6gDIZlPMXy2PuTlGkZtMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9191238008B4;
	Wed,  9 Aug 2023 14:44:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E3305CC00;
	Wed,  9 Aug 2023 14:44:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4FBB71946594;
	Wed,  9 Aug 2023 14:44:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B28911946588 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  9 Aug 2023 14:44:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9EF0D1121315; Wed,  9 Aug 2023 14:44:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9732E1121314
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 14:44:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A9E238008BC
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 14:44:40 +0000 (UTC)
Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6]) by
 relay.mimecast.com with ESMTP id us-mta-634-EkgFj_FRP9Oz0qfHNxobfQ-1; Wed,
 09 Aug 2023 10:44:37 -0400
X-MC-Unique: EkgFj_FRP9Oz0qfHNxobfQ-1
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
 by mail.parknet.co.jp (Postfix) with ESMTPSA id 593222055FA0;
 Wed,  9 Aug 2023 23:44:33 +0900 (JST)
Received: from devron.myhome.or.jp (foobar@devron.myhome.or.jp [192.168.0.3])
 by ibmpc.myhome.or.jp (8.17.2/8.17.2/Debian-1) with ESMTPS id
 379EiWdd218003
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 9 Aug 2023 23:44:33 +0900
Received: from devron.myhome.or.jp (foobar@localhost [127.0.0.1])
 by devron.myhome.or.jp (8.17.2/8.17.2/Debian-1) with ESMTPS id 379EiV6k197737
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 9 Aug 2023 23:44:31 +0900
Received: (from hirofumi@localhost)
 by devron.myhome.or.jp (8.17.2/8.17.2/Submit) id 379EiQ5o197730;
 Wed, 9 Aug 2023 23:44:26 +0900
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Jeff Layton <jlayton@kernel.org>
In-Reply-To: <7edc9239f73022b9c2a1d3f4f946153f85f94739.camel@kernel.org> (Jeff
 Layton's message of "Wed, 09 Aug 2023 10:22:54 -0400")
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-5-d1dec143a704@kernel.org>
 <87msz08vc7.fsf@mail.parknet.co.jp>
 <52bead1d6a33fec89944b96e2ec20d1ea8747a9a.camel@kernel.org>
 <878rak8hia.fsf@mail.parknet.co.jp>
 <7edc9239f73022b9c2a1d3f4f946153f85f94739.camel@kernel.org>
Date: Wed, 09 Aug 2023 23:44:26 +0900
Message-ID: <874jl88ed1.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
 "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: mail.parknet.co.jp
Content-Type: text/plain

Jeff Layton <jlayton@kernel.org> writes:

> I'm a little confused too. Why do you believe this will break
> -o relatime handling? This patch changes two things:
>
> 1/ it has fat_update_time fetch its own timestamp (and ignore the "now"
> parameter). This is in line with the changes in patch #3 of this series,
> which explains the rationale for this in more detail.
>
> 2/ it changes fat_update_time to also update the i_version if any of
> S_CTIME|S_MTIME|S_VERSION are set. relatime is all about the S_ATIME,
> and it is specifically excluded from that set.
>
> The rationale for the second change is is also in patch #3, but
> basically, we can't guarantee that current_time hasn't changed since we
> last checked for inode_needs_update_time, so if any of
> S_CTIME/S_MTIME/S_VERSION have changed, then we need to assume that any
> of them may need to be changed and attempt to update all 3.
>
> That said, I think the logic in fat_update_time isn't quite right. I
> think want something like this on top of this patch to ensure that the
> S_CTIME and S_MTIME get updated, even if the flags only have S_VERSION
> set.
>
> Thoughts?

I'm not talking about "relatime" at all, I'm always talking about
"lazytime".

I_DIRTY_TIME delays to update on disk inode only if changed
timestamp. But you changed it to I_DIRTY_SYNC, i.e. always update on
disk inode by timestamp.

Thanks.

> ---------------------8<-----------------------
>
> diff --git a/fs/fat/misc.c b/fs/fat/misc.c
> index 080a5035483f..313eef02f45c 100644
> --- a/fs/fat/misc.c
> +++ b/fs/fat/misc.c
> @@ -346,15 +346,21 @@ int fat_update_time(struct inode *inode, int flags)
>         if (inode->i_ino == MSDOS_ROOT_INO)
>                 return 0;
>  
> -       if (flags & (S_ATIME | S_CTIME | S_MTIME)) {
> -               fat_truncate_time(inode, NULL, flags);
> -               if (inode->i_sb->s_flags & SB_LAZYTIME)
> -                       dirty_flags |= I_DIRTY_TIME;
> -               else
> -                       dirty_flags |= I_DIRTY_SYNC;
> -       }
> +       /*
> +        * If any of the flags indicate an expicit change to the file, then we
> +        * need to ensure that we attempt to update all of 3. We do not do
> +        * this in the case of an S_ATIME-only update.
> +        */
> +       if (flags & (S_CTIME | S_MTIME | S_VERSION))
> +               flags |= S_CTIME | S_MTIME | S_VERSION;
> +
> +       fat_truncate_time(inode, NULL, flags);
> +       if (inode->i_sb->s_flags & SB_LAZYTIME)
> +               dirty_flags |= I_DIRTY_TIME;
> +       else
> +               dirty_flags |= I_DIRTY_SYNC;
>  
> -       if ((flags & (S_VERSION|S_CTIME|S_MTIME)) && inode_maybe_inc_iversion(inode, false))
> +       if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
>                 dirty_flags |= I_DIRTY_SYNC;
>

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

