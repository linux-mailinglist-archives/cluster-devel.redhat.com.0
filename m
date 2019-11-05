Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 57129EF9F2
	for <lists+cluster-devel@lfdr.de>; Tue,  5 Nov 2019 10:49:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572947341;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uBGCwhufPhnz9VZoDqLMs6vUQQ/tVZ+rt31R8xMXmAI=;
	b=RSzHT1PJi21iAFEaHXPQb/VqNZxkMfKxoHs2X9f04NA30OtocE5h0ziEx9AXpQc587N8mY
	1eb2pjGi6wkMBXk6WZOfnntO2RfU7slz0FGEVoJwuuY7wq8y6SlG13prkfGpzg2/U9im4p
	6/upBTN3D2kWKr6R/ClIBeKjk2Sm0qo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-QhSRZwCQP5aYbHm_nceQ3Q-1; Tue, 05 Nov 2019 04:48:59 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACF87800C73;
	Tue,  5 Nov 2019 09:48:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F360E60CDA;
	Tue,  5 Nov 2019 09:48:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99BE74BB65;
	Tue,  5 Nov 2019 09:48:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA59me6d023064 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 5 Nov 2019 04:48:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B84AB600CC; Tue,  5 Nov 2019 09:48:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C27D600C4;
	Tue,  5 Nov 2019 09:48:35 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC51A3086243;
	Tue,  5 Nov 2019 09:48:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 1A0D8B1D4;
	Tue,  5 Nov 2019 09:48:32 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 242661E4407; Tue,  5 Nov 2019 10:48:30 +0100 (CET)
Date: Tue, 5 Nov 2019 10:48:30 +0100
From: Jan Kara <jack@suse.cz>
To: Mark Salyzyn <salyzyn@android.com>
Message-ID: <20191105094830.GL22379@quack2.suse.cz>
References: <20191104215253.141818-1-salyzyn@android.com>
	<20191104215253.141818-2-salyzyn@android.com>
MIME-Version: 1.0
In-Reply-To: <20191104215253.141818-2-salyzyn@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Tue, 05 Nov 2019 09:48:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Tue, 05 Nov 2019 09:48:34 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'jack@suse.cz' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <jack@suse.cz>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
	jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
	linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Eric Paris <eparis@parisplace.org>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	netdev@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org,
	Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
	linux-unionfs@vger.kernel.org, Sage Weil <sage@redhat.com>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
	Eric Biggers <ebiggers@google.com>, Hugh Dickins <hughd@google.com>,
	James Morris <jmorris@namei.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	cluster-devel@redhat.com, selinux@vger.kernel.org,
	linux-integrity@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	Stephen Smalley <sds@tycho.nsa.gov>, linux-mm@kvack.org,
	Mark Salyzyn <salyzyn@google.com>,
	Serge Hallyn <serge@hallyn.com>, ecryptfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@gmail.com>,
	Chao Yu <chao@kernel.org>, linux-erofs@lists.ozlabs.org,
	Josef Bacik <josef@toxicpanda.com>, reiserfs-devel@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>, linux-mtd@lists.infradead.org,
	Phillip Lougher <phillip@squashfs.org.uk>, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	devel@lists.orangefs.org, Gao Xiang <xiang@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Paul Moore <paul@paul-moore.com>, linux-nfs@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mathieu Malaterre <malat@debian.org>, kernel-team@android.com,
	Jonathan Corbet <corbet@lwn.net>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Tyler Hicks <tyhicks@canonical.com>, Steve French <sfrench@samba.org>,
	linux-security-module@vger.kernel.org,
	ocfs2-devel@oss.oracle.com, Jan Kara <jack@suse.com>,
	Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Cluster-devel] [PATCH v15 1/4] Add flags option to get xattr
 method paired to __vfs_getxattr
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: QhSRZwCQP5aYbHm_nceQ3Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

> @@ -228,11 +228,11 @@ static int afs_xattr_get_yfs(const struct xattr_han=
dler *handler,
>  =09=09break;
>  =09case 1:
>  =09=09data =3D buf;
> -=09=09dsize =3D snprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
> +=09=09dsize =3D scnprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
>  =09=09break;
>  =09case 2:
>  =09=09data =3D buf;
> -=09=09dsize =3D snprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
> +=09=09dsize =3D scnprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
>  =09=09break;
>  =09case 3:

These scnprintf() changes (and there are more in the patch) probably
shouldn't be here... Otherwise the patch still looks good to me :).

=09=09=09=09=09=09=09=09Honza

--=20
Jan Kara <jack@suse.com>
SUSE Labs, CR

