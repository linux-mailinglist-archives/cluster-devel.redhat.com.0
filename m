Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 093B1775519
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Aug 2023 10:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691569397;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=fun65h1R4diSDJnLTZ/cxzR1ILC0j7wzISUUtC+n2VQ=;
	b=aBWBumpgTXYmenUdayvol36iLX+KgTopiuuj19ChBBGISkRdSIH45Zsgo3BiSN+yR5vrmy
	DWhGFwrDMCjDFe4P5vig4nZAGFPRJyeZpvWzf2kSs1VCTDby+cB/iGeynY9624mZNY73b0
	9K+2a7BuBaMAORhi21XAABbB8tUiofs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-X_5hZca3OtCGln5rZY6pbg-1; Wed, 09 Aug 2023 04:23:13 -0400
X-MC-Unique: X_5hZca3OtCGln5rZY6pbg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8244A85CCE0;
	Wed,  9 Aug 2023 08:23:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0466A4EA4C;
	Wed,  9 Aug 2023 08:23:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A2B41194658F;
	Wed,  9 Aug 2023 08:23:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4D6381946586 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  9 Aug 2023 08:23:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2DA86C15BB8; Wed,  9 Aug 2023 08:23:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 262F3C15BAE
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 08:23:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F40323C0D84C
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 08:23:07 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-209-xusGJCceP6mwbT4S0BCSog-1; Wed,
 09 Aug 2023 04:23:04 -0400
X-MC-Unique: xusGJCceP6mwbT4S0BCSog-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 49AE51F390;
 Wed,  9 Aug 2023 08:23:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 35AB613596;
 Wed,  9 Aug 2023 08:23:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5Kd7DOVM02RCbwAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 09 Aug 2023 08:23:01 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 9D476A0769; Wed,  9 Aug 2023 10:23:00 +0200 (CEST)
Date: Wed, 9 Aug 2023 10:23:00 +0200
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <20230809082300.veczantamvcpinxu@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-6-d1dec143a704@kernel.org>
 <20230808093701.ggyj7tyqonivl7tb@quack3>
 <20230809-handreichung-umgearbeitet-951eebed4d61@brauner>
MIME-Version: 1.0
In-Reply-To: <20230809-handreichung-umgearbeitet-951eebed4d61@brauner>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH v7 06/13] ubifs: have ubifs_update_time
 use inode_update_timestamps
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
 Jan Kara <jack@suse.cz>, linux-xfs@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, ecryptfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 samba-technical@lists.samba.org, codalist@coda.cs.cmu.edu,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, Ilya Dryomov <idryomov@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.cz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed 09-08-23 09:06:34, Christian Brauner wrote:
> On Tue, Aug 08, 2023 at 11:37:01AM +0200, Jan Kara wrote:
> > On Mon 07-08-23 15:38:37, Jeff Layton wrote:
> > > In later patches, we're going to drop the "now" parameter from the
> > > update_time operation. Prepare ubifs for this, by having it use the new
> > > inode_update_timestamps helper.
> > > 
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > 
> > One comment below:
> > 
> > > diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> > > index df9086b19cd0..2d0178922e19 100644
> > > --- a/fs/ubifs/file.c
> > > +++ b/fs/ubifs/file.c
> > > @@ -1397,15 +1397,9 @@ int ubifs_update_time(struct inode *inode, struct timespec64 *time,
> > >  		return err;
> > >  
> > >  	mutex_lock(&ui->ui_mutex);
> > > -	if (flags & S_ATIME)
> > > -		inode->i_atime = *time;
> > > -	if (flags & S_CTIME)
> > > -		inode_set_ctime_to_ts(inode, *time);
> > > -	if (flags & S_MTIME)
> > > -		inode->i_mtime = *time;
> > > -
> > > -	release = ui->dirty;
> > > +	inode_update_timestamps(inode, flags);
> > >  	__mark_inode_dirty(inode, I_DIRTY_SYNC);
> > > +	release = ui->dirty;
> > >  	mutex_unlock(&ui->ui_mutex);
> > 
> > I think this is wrong. You need to keep sampling ui->dirty before calling
> > __mark_inode_dirty(). Otherwise you could release budget for inode update
> > you really need...
> 
> Fixed in-tree.

Thanks. With that feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

