Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A32C776151
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Aug 2023 15:38:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691588293;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KXdgc6EQIVEa9D+5j3JIR4aqG3RqDbmd/d6hxGdzYFY=;
	b=E4ElpIipcFPycBA4jtV17GuXRYvENLKH4L06SohwEGBhFIPYd894s7XmYrnuFQfMCoPa25
	rnOfBgDSXPJTHqeDG6BnJKgpO+MdKKHjtjPgb8JP1GdBB9TgY2NF9lB524+VnnHNtNy/fc
	XtWzVFHgmYGaGKjISW49kaGMNkhO7m0=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-V6QyJJL4PCCXWtXZqKNz8A-1; Wed, 09 Aug 2023 09:38:09 -0400
X-MC-Unique: V6QyJJL4PCCXWtXZqKNz8A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D2523C0E47A;
	Wed,  9 Aug 2023 13:38:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D6B4DC15BAE;
	Wed,  9 Aug 2023 13:38:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8159D1946595;
	Wed,  9 Aug 2023 13:38:05 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9CCAC1946588 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  9 Aug 2023 13:36:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 844FF1121315; Wed,  9 Aug 2023 13:36:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B13F1121314
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 13:36:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 595658DC670
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 13:36:46 +0000 (UTC)
Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6]) by
 relay.mimecast.com with ESMTP id us-mta-589-iXnqOAayOmCJRvFwzT_obA-1; Wed,
 09 Aug 2023 09:36:41 -0400
X-MC-Unique: iXnqOAayOmCJRvFwzT_obA-1
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
 by mail.parknet.co.jp (Postfix) with ESMTPSA id 6E7A32055FA2;
 Wed,  9 Aug 2023 22:36:36 +0900 (JST)
Received: from devron.myhome.or.jp (foobar@devron.myhome.or.jp [192.168.0.3])
 by ibmpc.myhome.or.jp (8.17.2/8.17.2/Debian-1) with ESMTPS id
 379DaZlY216308
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 9 Aug 2023 22:36:36 +0900
Received: from devron.myhome.or.jp (foobar@localhost [127.0.0.1])
 by devron.myhome.or.jp (8.17.2/8.17.2/Debian-1) with ESMTPS id 379DaZkg190033
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 9 Aug 2023 22:36:35 +0900
Received: (from hirofumi@localhost)
 by devron.myhome.or.jp (8.17.2/8.17.2/Submit) id 379DaTmi190025;
 Wed, 9 Aug 2023 22:36:29 +0900
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Jeff Layton <jlayton@kernel.org>
In-Reply-To: <52bead1d6a33fec89944b96e2ec20d1ea8747a9a.camel@kernel.org> (Jeff
 Layton's message of "Wed, 09 Aug 2023 06:10:53 -0400")
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-5-d1dec143a704@kernel.org>
 <87msz08vc7.fsf@mail.parknet.co.jp>
 <52bead1d6a33fec89944b96e2ec20d1ea8747a9a.camel@kernel.org>
Date: Wed, 09 Aug 2023 22:36:29 +0900
Message-ID: <878rak8hia.fsf@mail.parknet.co.jp>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: mail.parknet.co.jp
Content-Type: text/plain

Jeff Layton <jlayton@kernel.org> writes:

> On Wed, 2023-08-09 at 17:37 +0900, OGAWA Hirofumi wrote:
>> Jeff Layton <jlayton@kernel.org> writes:
>> 
>> > Also, it may be that things have changed by the time we get to calling
>> > fat_update_time after checking inode_needs_update_time. Ensure that we
>> > attempt the i_version bump if any of the S_* flags besides S_ATIME are
>> > set.
>> 
>> I'm not sure what it meaning though, this is from
>> generic_update_time(). Are you going to change generic_update_time()
>> too? If so, it doesn't break lazytime feature?
>> 
>
> Yes. generic_update_time is also being changed in a similar fashion.
> This shouldn't break the lazytime feature: lazytime is all about how and
> when timestamps get written to disk. This work is all about which
> clocksource the timestamps originally come from.

I can only find the following update in this series, another series
updates generic_update_time()? The patch updates only if S_VERSION is
set.

Your fat patch sets I_DIRTY_SYNC always instead of I_DIRTY_TIME. When I
last time checked lazytime, and it was depending on I_DIRTY_TIME.

Are you sure it doesn't break lazytime? I'm totally confusing, and
really similar with generic_update_time()?

Thanks.

+/**
+ * generic_update_time - update the timestamps on the inode
+ * @inode: inode to be updated
+ * @flags: S_* flags that needed to be updated
+ *
+ * The update_time function is called when an inode's timestamps need to be
+ * updated for a read or write operation. In the case where any of S_MTIME, S_CTIME,
+ * or S_VERSION need to be updated we attempt to update all three of them. S_ATIME
+ * updates can be handled done independently of the rest.
+ *
+ * Returns a S_* mask indicating which fields were updated.
+ */
+int generic_update_time(struct inode *inode, int flags)
+{
+	int updated = inode_update_timestamps(inode, flags);
+	int dirty_flags = 0;
 
+	if (updated & (S_ATIME|S_MTIME|S_CTIME))
+		dirty_flags = inode->i_sb->s_flags & SB_LAZYTIME ? I_DIRTY_TIME : I_DIRTY_SYNC;
+	if (updated & S_VERSION)
+		dirty_flags |= I_DIRTY_SYNC;
 	__mark_inode_dirty(inode, dirty_flags);
-	return 0;
+	return updated;
 }

>> > -	if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
>> > +	if ((flags & (S_VERSION|S_CTIME|S_MTIME)) && inode_maybe_inc_iversion(inode, false))
>> >  		dirty_flags |= I_DIRTY_SYNC;
>> >  
>> >  	__mark_inode_dirty(inode, dirty_flags);
>> 

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

