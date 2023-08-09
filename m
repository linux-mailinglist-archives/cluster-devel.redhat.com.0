Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B761A7769A7
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Aug 2023 22:15:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691612106;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=coZ6ulv7PeTT3ENpAYsqPZL/64NrN1NUvf045vqCEaE=;
	b=TCvv5FQ+7mEQw9Ff/V/h7hD/A4Dwb7thChdyu5TYo6qHTPBzA2BBavzLYhDJ88d874yKUv
	T7zz4c75Pdvdr9I5tra+3NPBMNY69e6XynZ29UrOydNGXlm3phTY4SRocqJA/T2fyZfhap
	AGAxD9FEsVGTqyUTGy7wG86aTotkJ0I=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-lzfokzaKM7i7W3gLkphj8A-1; Wed, 09 Aug 2023 16:15:04 -0400
X-MC-Unique: lzfokzaKM7i7W3gLkphj8A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 762CA3C0FCA9;
	Wed,  9 Aug 2023 20:15:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3DA440C2077;
	Wed,  9 Aug 2023 20:15:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 75AE81946594;
	Wed,  9 Aug 2023 20:15:01 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 798C81946588 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  9 Aug 2023 20:14:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 633B81121314; Wed,  9 Aug 2023 20:14:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B5AF1121315
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 20:14:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06DC53C0F677
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 20:14:46 +0000 (UTC)
Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6]) by
 relay.mimecast.com with ESMTP id us-mta-231--J65q9e5Pb-RKV4IIUy5xA-1; Wed,
 09 Aug 2023 16:14:41 -0400
X-MC-Unique: -J65q9e5Pb-RKV4IIUy5xA-1
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
 by mail.parknet.co.jp (Postfix) with ESMTPSA id 0B7972055FA7;
 Thu, 10 Aug 2023 05:14:36 +0900 (JST)
Received: from devron.myhome.or.jp (foobar@devron.myhome.or.jp [192.168.0.3])
 by ibmpc.myhome.or.jp (8.17.2/8.17.2/Debian-1) with ESMTPS id
 379KEYfO226784
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 05:14:35 +0900
Received: from devron.myhome.or.jp (foobar@localhost [127.0.0.1])
 by devron.myhome.or.jp (8.17.2/8.17.2/Debian-1) with ESMTPS id 379KEYHK237230
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 05:14:34 +0900
Received: (from hirofumi@localhost)
 by devron.myhome.or.jp (8.17.2/8.17.2/Submit) id 379KESDU237221;
 Thu, 10 Aug 2023 05:14:28 +0900
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Jeff Layton <jlayton@kernel.org>
In-Reply-To: <edf8e8ca3b38e56f30e0d24ac7293f848ffee371.camel@kernel.org> (Jeff
 Layton's message of "Wed, 09 Aug 2023 15:04:42 -0400")
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
Date: Thu, 10 Aug 2023 05:14:28 +0900
Message-ID: <87a5v06kij.fsf@mail.parknet.co.jp>
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
 Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: mail.parknet.co.jp
Content-Type: text/plain

Jeff Layton <jlayton@kernel.org> writes:

> When you say it "doesn't work the same", what do you mean, specifically?
> I had to make some allowances for the fact that FAT is substantially
> different in its timestamp handling, and I tried to preserve existing
> behavior as best I could.

Ah, ok. I was misreading some.

inode_update_timestamps() checks IS_I_VERSION() now, not S_VERSION.  So,
if adding the check of IS_I_VERSION() and (S_MTIME|S_CTIME|S_VERSION) to
FAT?

With it, IS_I_VERSION() would be false on FAT, and I'm fine.

I.e. something like

	if ((flags & (S_VERSION|S_CTIME|S_MTIME)) && IS_I_VERSION(inode)
	    && inode_maybe_inc_iversion(inode, false))
  		dirty_flags |= I_DIRTY_SYNC;

Thanks.
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

