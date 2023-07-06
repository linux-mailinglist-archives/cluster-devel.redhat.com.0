Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA0C74996B
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Jul 2023 12:27:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688639247;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=bA8lspzVCI0QkBBZSOZ2NaXyU+WIcRfNoOGE3kPhpJ0=;
	b=ZC5XJE7u239RZwSc1Ulk0FxT4lM5BmyCIsYJQDs0POm8r8eF1gvOIjwDzPQgg5hxfJxB1/
	oAfxPiKDK2uSmKrJqDPmm8d2d+88dWm7ACQ4TiscpMuABxdAbGooGJ0BeMwlMuzoybv86l
	fWxF2IOT3/6s1/UdTyw9pq8x35n5Qgg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-s-qhwjoGMZWgKHtxr_TS0A-1; Thu, 06 Jul 2023 06:27:22 -0400
X-MC-Unique: s-qhwjoGMZWgKHtxr_TS0A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 564A6101A528;
	Thu,  6 Jul 2023 10:27:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B9D9F6401;
	Thu,  6 Jul 2023 10:27:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1063719465A0;
	Thu,  6 Jul 2023 10:27:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 964861946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  6 Jul 2023 10:27:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6ED334CD0C7; Thu,  6 Jul 2023 10:27:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6768D4CD0CA
 for <cluster-devel@redhat.com>; Thu,  6 Jul 2023 10:27:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 477ED809F8F
 for <cluster-devel@redhat.com>; Thu,  6 Jul 2023 10:27:17 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-117-k8Bfg6IcPD62DAbSiwopXQ-1; Thu,
 06 Jul 2023 06:27:10 -0400
X-MC-Unique: k8Bfg6IcPD62DAbSiwopXQ-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EA73A20314;
 Thu,  6 Jul 2023 10:27:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B165913A26;
 Thu,  6 Jul 2023 10:27:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wFw7KvqWpmTRdAAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 06 Jul 2023 10:27:06 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 1CB0FA0707; Thu,  6 Jul 2023 12:27:06 +0200 (CEST)
Date: Thu, 6 Jul 2023 12:27:06 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230706102706.w7udmbmuwp7hhcry@quack3>
References: <20230705185812.579118-1-jlayton@kernel.org>
 <20230705185812.579118-3-jlayton@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230705185812.579118-3-jlayton@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH v2 08/92] fs: new helper:
 simple_rename_timestamp
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
Cc: lucho@ionkov.net, rafael@kernel.org, djwong@kernel.org, al@alarsen.net,
 cmllamas@google.com, andrii@kernel.org, hughd@google.com,
 john.johansen@canonical.com, agordeev@linux.ibm.com, hch@lst.de,
 hubcap@omnibond.com, pc@manguebit.com, linux-xfs@vger.kernel.org,
 bvanassche@acm.org, jeffxu@chromium.org, mpe@ellerman.id.au,
 john@keeping.me.uk, yi.zhang@huawei.com, jmorris@namei.org,
 christophe.leroy@csgroup.eu, code@tyhicks.com, stern@rowland.harvard.edu,
 borntraeger@linux.ibm.com, devel@lists.orangefs.org, mirimmad17@gmail.com,
 sprasad@microsoft.com, jaharkes@cs.cmu.edu, linux-um@lists.infradead.org,
 npiggin@gmail.com, viro@zeniv.linux.org.uk, ericvh@kernel.org,
 surenb@google.com, trond.myklebust@hammerspace.com, anton@tuxera.com,
 brauner@kernel.org, wsa+renesas@sang-engineering.com,
 gregkh@linuxfoundation.org, stephen.smalley.work@gmail.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, lsahlber@redhat.com,
 senozhatsky@chromium.org, arve@android.com, chuck.lever@oracle.com,
 svens@linux.ibm.com, jolsa@kernel.org, jack@suse.com, tj@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org,
 xu.xin16@zte.com.cn, shaggy@kernel.org, dhavale@google.com,
 penguin-kernel@I-love.SAKURA.ne.jp, zohar@linux.ibm.com, linux-mm@kvack.org,
 joel@joelfernandes.org, edumazet@google.com, sdf@google.com, jomajm@gmail.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org, paul@paul-moore.com,
 leon@kernel.org, john.fastabend@gmail.com, mcgrof@kernel.org,
 chi.minghao@zte.com.cn, codalist@coda.cs.cmu.edu, selinux@vger.kernel.org,
 zhangpeng362@huawei.com, quic_ugoswami@quicinc.com, yhs@fb.com,
 yzaikin@google.com, linkinjeon@kernel.org, mhiramat@kernel.org,
 ecryptfs@vger.kernel.org, tkjos@android.com, madkar@cs.stonybrook.edu,
 gor@linux.ibm.com, yuzhe@nfschina.com, linuxppc-dev@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, miklos@szeredi.hu, huyue2@coolpad.com,
 jaegeuk@kernel.org, gargaditya08@live.com, maco@android.com,
 hirofumi@mail.parknet.co.jp, haoluo@google.com, tony.luck@intel.com,
 tytso@mit.edu, nico@fluxnic.net, linux-ntfs-dev@lists.sourceforge.net,
 muchun.song@linux.dev, roberto.sassu@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net, yang.yang29@zte.com.cn,
 gpiccoli@igalia.com, ebiederm@xmission.com, anna@kernel.org,
 quic_uaggarwa@quicinc.com, bwarrum@linux.ibm.com, mike.kravetz@oracle.com,
 jingyuwang_vip@163.com, linux-efi@vger.kernel.org, error27@gmail.com,
 martin@omnibond.com, trix@redhat.com, ocfs2-devel@lists.linux.dev,
 ast@kernel.org, sebastian.reichel@collabora.com, clm@fb.com,
 linux-mtd@lists.infradead.org, willy@infradead.org, marc.dionne@auristor.com,
 linux-afs@lists.infradead.org, raven@themaw.net, naohiro.aota@wdc.com,
 daniel@iogearbox.net, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, quic_linyyuan@quicinc.com, coda@cs.cmu.edu,
 slava@dubeyko.com, idryomov@gmail.com, pabeni@redhat.com, adobriyan@gmail.com,
 serge@hallyn.com, chengzhihao1@huawei.com, axboe@kernel.dk, amir73il@gmail.com,
 linuszeng@tencent.com, keescook@chromium.org, arnd@arndb.de,
 autofs@vger.kernel.org, rostedt@goodmis.org, yifeliu@cs.stonybrook.edu,
 dlemoal@kernel.org, eparis@parisplace.org, ceph-devel@vger.kernel.org,
 xiang@kernel.org, yijiangshan@kylinos.cn, dhowells@redhat.com,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, kolga@netapp.com,
 song@kernel.org, samba-technical@lists.samba.org, sfrench@samba.org,
 jk@ozlabs.org, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org,
 davem@davemloft.net, jfs-discussion@lists.sourceforge.net,
 princekumarmaurya06@gmail.com, ebiggers@google.com, neilb@suse.de,
 asmadeus@codewreck.org, linux_oss@crudebyte.com, me@bobcopeland.com,
 kpsingh@kernel.org, okanatov@gmail.com,
 almaz.alexandrovich@paragon-software.com, joseph.qi@linux.alibaba.com,
 hayama@lineo.co.jp, adilger.kernel@dilger.ca, mikulas@artax.karlin.mff.cuni.cz,
 shaozhengchao@huawei.com, chenzhongjin@huawei.com, ardb@kernel.org,
 anton.ivanov@cambridgegreys.com, richard@nod.at, mark@fasheh.com,
 shr@devkernel.io, Dai.Ngo@oracle.com, cluster-devel@redhat.com, jgg@ziepe.ca,
 kuba@kernel.org, riel@surriel.com, salah.triki@gmail.com, dushistov@mail.ru,
 linux-cifs@vger.kernel.org, hca@linux.ibm.com, chao@kernel.org,
 apparmor@lists.ubuntu.com, josef@toxicpanda.com, Liam.Howlett@Oracle.com,
 tom@talpey.com, hdegoede@redhat.com, linux-hardening@vger.kernel.org,
 aivazian.tigran@gmail.com, dsterba@suse.com, xiubli@redhat.com,
 konishi.ryusuke@gmail.com, jgross@suse.com, jth@kernel.org,
 rituagar@linux.ibm.com, luisbg@kernel.org, martin.lau@linux.dev,
 v9fs@lists.linux.dev, fmdefrancesco@gmail.com, linux-unionfs@vger.kernel.org,
 lrh2000@pku.edu.cn, linux-security-module@vger.kernel.org,
 ezk@cs.stonybrook.edu, jefflexu@linux.alibaba.com, linux@treblig.org,
 hannes@cmpxchg.org, phillip@squashfs.org.uk, johannes@sipsolutions.net,
 sj1557.seo@samsung.com, dwmw2@infradead.org,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 jlbec@evilplan.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.cz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed 05-07-23 14:58:11, Jeff Layton wrote:
> A rename potentially involves updating 4 different inode timestamps. Add
> a function that handles the details sanely, and convert the libfs.c
> callers to use it.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/libfs.c         | 36 +++++++++++++++++++++++++++---------
>  include/linux/fs.h |  2 ++
>  2 files changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/libfs.c b/fs/libfs.c
> index a7e56baf8bbd..9ee79668c909 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -692,6 +692,31 @@ int simple_rmdir(struct inode *dir, struct dentry *dentry)
>  }
>  EXPORT_SYMBOL(simple_rmdir);
>  
> +/**
> + * simple_rename_timestamp - update the various inode timestamps for rename
> + * @old_dir: old parent directory
> + * @old_dentry: dentry that is being renamed
> + * @new_dir: new parent directory
> + * @new_dentry: target for rename
> + *
> + * POSIX mandates that the old and new parent directories have their ctime and
> + * mtime updated, and that inodes of @old_dentry and @new_dentry (if any), have
> + * their ctime updated.
> + */
> +void simple_rename_timestamp(struct inode *old_dir, struct dentry *old_dentry,
> +			     struct inode *new_dir, struct dentry *new_dentry)
> +{
> +	struct inode *newino = d_inode(new_dentry);
> +
> +	old_dir->i_mtime = inode_set_ctime_current(old_dir);
> +	if (new_dir != old_dir)
> +		new_dir->i_mtime = inode_set_ctime_current(new_dir);
> +	inode_set_ctime_current(d_inode(old_dentry));
> +	if (newino)
> +		inode_set_ctime_current(newino);
> +}
> +EXPORT_SYMBOL_GPL(simple_rename_timestamp);
> +
>  int simple_rename_exchange(struct inode *old_dir, struct dentry *old_dentry,
>  			   struct inode *new_dir, struct dentry *new_dentry)
>  {
> @@ -707,11 +732,7 @@ int simple_rename_exchange(struct inode *old_dir, struct dentry *old_dentry,
>  			inc_nlink(old_dir);
>  		}
>  	}
> -	old_dir->i_ctime = old_dir->i_mtime =
> -	new_dir->i_ctime = new_dir->i_mtime =
> -	d_inode(old_dentry)->i_ctime =
> -	d_inode(new_dentry)->i_ctime = current_time(old_dir);
> -
> +	simple_rename_timestamp(old_dir, old_dentry, new_dir, new_dentry);
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(simple_rename_exchange);
> @@ -720,7 +741,6 @@ int simple_rename(struct mnt_idmap *idmap, struct inode *old_dir,
>  		  struct dentry *old_dentry, struct inode *new_dir,
>  		  struct dentry *new_dentry, unsigned int flags)
>  {
> -	struct inode *inode = d_inode(old_dentry);
>  	int they_are_dirs = d_is_dir(old_dentry);
>  
>  	if (flags & ~(RENAME_NOREPLACE | RENAME_EXCHANGE))
> @@ -743,9 +763,7 @@ int simple_rename(struct mnt_idmap *idmap, struct inode *old_dir,
>  		inc_nlink(new_dir);
>  	}
>  
> -	old_dir->i_ctime = old_dir->i_mtime = new_dir->i_ctime =
> -		new_dir->i_mtime = inode->i_ctime = current_time(old_dir);
> -
> +	simple_rename_timestamp(old_dir, old_dentry, new_dir, new_dentry);
>  	return 0;
>  }
>  EXPORT_SYMBOL(simple_rename);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index bdfbd11a5811..14e38bd900f1 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2979,6 +2979,8 @@ extern int simple_open(struct inode *inode, struct file *file);
>  extern int simple_link(struct dentry *, struct inode *, struct dentry *);
>  extern int simple_unlink(struct inode *, struct dentry *);
>  extern int simple_rmdir(struct inode *, struct dentry *);
> +void simple_rename_timestamp(struct inode *old_dir, struct dentry *old_dentry,
> +			     struct inode *new_dir, struct dentry *new_dentry);
>  extern int simple_rename_exchange(struct inode *old_dir, struct dentry *old_dentry,
>  				  struct inode *new_dir, struct dentry *new_dentry);
>  extern int simple_rename(struct mnt_idmap *, struct inode *,
> -- 
> 2.41.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

