Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 987A77A60FA
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Sep 2023 13:15:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695122105;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0ypJH1plB5t/6spPGIv9z3MNHu5XuM/79kvqqxTcYzY=;
	b=Q4JfjFadh1ecrp6PRJ5SYPaVHeG66j31FxjTEBhFxLErJTxZKlzyP/A1fBEqEE+jvouSXY
	9OuTWl/m9VFy8717Wy3IfJD85sLD7SiRgvhG4fGuF2c+8LwhMTJuIoxYMEWC8T1ro84TmJ
	XaUirQeUj8ThnRGmP8ApLfLawl/7UGs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-wIuGswYONXKKemsVZlyfjg-1; Tue, 19 Sep 2023 07:15:01 -0400
X-MC-Unique: wIuGswYONXKKemsVZlyfjg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A740E803491;
	Tue, 19 Sep 2023 11:15:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5813240C6EBF;
	Tue, 19 Sep 2023 11:14:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 05EE41946594;
	Tue, 19 Sep 2023 11:14:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9FAC5194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 19 Sep 2023 11:14:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8A5271C554; Tue, 19 Sep 2023 11:14:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8294C2904
 for <cluster-devel@redhat.com>; Tue, 19 Sep 2023 11:14:40 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 641D4101B041
 for <cluster-devel@redhat.com>; Tue, 19 Sep 2023 11:14:40 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-556-EI6hC1jCN42QfkV86lXbkw-1; Tue,
 19 Sep 2023 07:14:38 -0400
X-MC-Unique: EI6hC1jCN42QfkV86lXbkw-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 163C61FDBE;
 Tue, 19 Sep 2023 11:04:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C72D013458;
 Tue, 19 Sep 2023 11:04:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TL5uMVmACWVNYAAAMHmgww
 (envelope-from <jack@suse.cz>); Tue, 19 Sep 2023 11:04:57 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 11C86A0759; Tue, 19 Sep 2023 13:04:57 +0200 (CEST)
Date: Tue, 19 Sep 2023 13:04:57 +0200
From: Jan Kara <jack@suse.cz>
To: Xi Ruoyao <xry111@linuxfromscratch.org>
Message-ID: <20230919110457.7fnmzo4nqsi43yqq@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-12-d1dec143a704@kernel.org>
 <bf0524debb976627693e12ad23690094e4514303.camel@linuxfromscratch.org>
MIME-Version: 1.0
In-Reply-To: <bf0524debb976627693e12ad23690094e4514303.camel@linuxfromscratch.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH v7 12/13] ext4: switch to multigrain
 timestamps
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
 bug-gnulib@gnu.org, Miklos Szeredi <miklos@szeredi.hu>,
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
 Christian Brauner <brauner@kernel.org>, linux-ext4@vger.kernel.org,
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
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.cz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 19-09-23 15:05:24, Xi Ruoyao wrote:
> On Mon, 2023-08-07 at 15:38 -0400, Jeff Layton wrote:
> > Enable multigrain timestamps, which should ensure that there is an
> > apparent change to the timestamp whenever it has been written after
> > being actively observed via getattr.
> >=20
> > For ext4, we only need to enable the FS_MGTIME flag.
>=20
> Hi Jeff,
>=20
> This patch causes a gnulib test failure:
>=20
> $ ~/sources/lfs/grep-3.11/gnulib-tests/test-stat-time
> test-stat-time.c:141: assertion 'statinfo[0].st_mtime < statinfo[2].st_mt=
ime || (statinfo[0].st_mtime =3D=3D statinfo[2].st_mtime && (get_stat_mtime=
_ns (&statinfo[0]) < get_stat_mtime_ns (&statinfo[2])))' failed
> Aborted (core dumped)
>=20
> The source code of the test:
> https://git.savannah.gnu.org/cgit/gnulib.git/tree/tests/test-stat-time.c
>=20
> Is this an expected change?

Kind of yes. The test first tries to estimate filesystem timestamp
granularity in nap() function - due to this patch, the detected granularity
will likely be 1 ns so effectively all the test calls will happen
immediately one after another. But we don't bother setting the timestamps
with more than 1 jiffy (usually 4 ms) precision unless we think someone is
watching. So as a result timestamps of all stamp1 and stamp2 files are
going to be equal which makes the test fail.

The ultimate problem is that a sequence like:

write(f1)
stat(f2)
write(f2)
stat(f2)
write(f1)
stat(f1)

can result in f1 timestamp to be (slightly) lower than the final f2
timestamp because the second write to f1 didn't bother updating the
timestamp. That can indeed be a bit confusing to programs if they compare
timestamps between two files. Jeff?

=09=09=09=09=09=09=09=09Honza


> > Acked-by: Theodore Ts'o <tytso@mit.edu>
> > Reviewed-by: Jan Kara <jack@suse.cz>
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> > =A0fs/ext4/super.c | 2 +-
> > =A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> > index b54c70e1a74e..cb1ff47af156 100644
> > --- a/fs/ext4/super.c
> > +++ b/fs/ext4/super.c
> > @@ -7279,7 +7279,7 @@ static struct file_system_type ext4_fs_type =3D {
> > =A0=09.init_fs_context=09=3D ext4_init_fs_context,
> > =A0=09.parameters=09=09=3D ext4_param_specs,
> > =A0=09.kill_sb=09=09=3D kill_block_super,
> > -=09.fs_flags=09=09=3D FS_REQUIRES_DEV | FS_ALLOW_IDMAP,
> > +=09.fs_flags=09=09=3D FS_REQUIRES_DEV | FS_ALLOW_IDMAP |
> > FS_MGTIME,
> > =A0};
> > =A0MODULE_ALIAS_FS("ext4");
> > =A0
> >=20
>=20
--=20
Jan Kara <jack@suse.com>
SUSE Labs, CR

