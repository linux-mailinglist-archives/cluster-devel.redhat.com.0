Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E8F1AE0E14
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Oct 2019 00:14:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571782479;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=M066Y4wtv274qtUuBEiTumI6rYjLq/AjrOnnAE4pgRQ=;
	b=H35GSDUQ63u2rOu24vVLOo/5cVpPhuyQCzlfJ0lGHqXgdC6P1fvqhph2NCBlVhZfDyRgI5
	4cQwNGsjrgRodXXFbkG9OxiUsX4rRJk87yMbfMZJ/OjUg8Wq1tREC1RRyETUAd5Vv/KQAQ
	6jh1b7URvIAWN2l4C5sLObeeTnWrh0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-vD2-IIS-NMePfihfGWXTDQ-1; Tue, 22 Oct 2019 18:14:38 -0400
X-MC-Unique: vD2-IIS-NMePfihfGWXTDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D93C2801E52;
	Tue, 22 Oct 2019 22:14:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 068B86012D;
	Tue, 22 Oct 2019 22:14:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7062D180085A;
	Tue, 22 Oct 2019 22:14:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9MMEG7U026038 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 22 Oct 2019 18:14:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A779C60872; Tue, 22 Oct 2019 22:14:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A17FC60856
	for <cluster-devel@redhat.com>; Tue, 22 Oct 2019 22:14:14 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3F7910CC1E6
	for <cluster-devel@redhat.com>; Tue, 22 Oct 2019 22:14:12 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b4so2588597pfr.12
	for <cluster-devel@redhat.com>; Tue, 22 Oct 2019 15:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=jdSjvTdb7YhhV+yeBoGT2uoOFpXOTdsEt8mUL1v5JjU=;
	b=nTi6NIuqpzY3pASAAiaaknd6ySolCoQD9VZLeoNEu9V28MvX1cw9piQodWWnbmaYyU
	e7GqP1NRreCfyKmLYSCb+2qJ4oscNARUq2EqLIj49soeLGCEf7uu/WNh7AfN31oG1DU8
	H7kObG+lUjEaVh6630Rf2G/1qeYnTcittrPAVLVtLgBWw2w7I/prM2Br4jsbG3h33v6I
	mqf5oyOM4GEsKuevfXavGboeFuIuUncZt5+MPZa/xmg/EofWVUCCYCD0NlF0HQFecsNz
	VzPdm/E1YakxJSbESoKRsRpfun5OpbxI3i876eKgeCyA9tt53dFXTux7AOAWFxDhOm2I
	sYdA==
X-Gm-Message-State: APjAAAVNgnGBDRgKz3BDFTYzBgYEFiQztahCwOwP7Xu1wV2pwC6bihq1
	sF4Pzcsyc+kSfb8dGceOA3GV/Q==
X-Google-Smtp-Source: APXvYqyCGFGpT2C3cY7XT0d1Dal+bVUH3K7BRELFdnAX59mbUm04n1z8zWdaK4LGbMaAkUt/N9526w==
X-Received: by 2002:a17:90a:a60f:: with SMTP id
	c15mr7467310pjq.18.1571782451665; 
	Tue, 22 Oct 2019 15:14:11 -0700 (PDT)
Received: from cabot-wlan.adilger.int (S0106a84e3fe4b223.cg.shawcable.net.
	[70.77.216.213]) by smtp.gmail.com with ESMTPSA id
	r24sm21302038pfh.69.2019.10.22.15.13.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Oct 2019 15:14:10 -0700 (PDT)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <8CE5B6E8-DCB7-4F0B-91C1-48030947F585@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Tue, 22 Oct 2019 16:13:53 -0600
In-Reply-To: <20191022204453.97058-2-salyzyn@android.com>
To: Mark Salyzyn <salyzyn@android.com>
References: <20191022204453.97058-1-salyzyn@android.com>
	<20191022204453.97058-2-salyzyn@android.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.65]);
	Tue, 22 Oct 2019 22:14:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Tue, 22 Oct 2019 22:14:12 +0000 (UTC) for IP:'209.85.210.195'
	DOMAIN:'mail-pf1-f195.google.com'
	HELO:'mail-pf1-f195.google.com' FROM:'adilger@dilger.ca' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.195 mail-pf1-f195.google.com 209.85.210.195
	mail-pf1-f195.google.com <adilger@dilger.ca>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Hugh Dickins <hughd@google.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Mike Marshall <hubcap@omnibond.com>,
	James Morris <jmorris@namei.org>, devel@lists.orangefs.org,
	Eric Van Hensbergen <ericvh@gmail.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Mathieu Malaterre <malat@debian.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jan Kara <jack@suse.com>, Casey Schaufler <casey@schaufler-ca.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Kleikamp <shaggy@kernel.org>, linux-doc@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	CIFS <linux-cifs@vger.kernel.org>, Paul Moore <paul@paul-moore.com>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Eric Sandeen <sandeen@sandeen.net>, kernel-team@android.com,
	Chao Yu <chao@kernel.org>, selinux@vger.kernel.org,
	Brian Foster <bfoster@redhat.com>, reiserfs-devel@vger.kernel.org,
	Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Jonathan Corbet <corbet@lwn.net>, linux-f2fs-devel@lists.sourceforge.net,
	linux-integrity@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>,
	Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
	linux-afs@lists.infradead.org, Miklos Szeredi <miklos@szeredi.hu>,
	Ilya Dryomov <idryomov@gmail.com>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
	Eric Paris <eparis@parisplace.org>,
	ceph-devel <ceph-devel@vger.kernel.org>, Gao Xiang <xiang@kernel.org>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	samba-technical <samba-technical@lists.samba.org>,
	linux-xfs <linux-xfs@vger.kernel.org>, Tejun Heo <tj@kernel.org>,
	linux-erofs@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
	ocfs2-devel@oss.oracle.com, jfs-discussion@lists.sourceforge.net,
	Jan Kara <jack@suse.cz>, Eric Biggers <ebiggers@google.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	overlayfs <linux-unionfs@vger.kernel.org>,
	David Howells <dhowells@redhat.com>,
	linux-mm <linux-mm@kvack.org>, Sage Weil <sage@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Mark Fasheh <mark@fasheh.com>, cluster-devel@redhat.com,
	Steve French <sfrench@samba.org>, v9fs-developer@lists.sourceforge.net,
	Bharath Vedartham <linux.bhar@gmail.com>,
	Jann Horn <jannh@google.com>, ecryptfs@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, netdev@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Tyler Hicks <tyhicks@canonical.com>, linux-security-module@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Cluster-devel] [PATCH v14 1/5] Add flags option to get xattr
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed;
	boundary="Apple-Mail=_37420EF0-273E-43F4-97D0-62F6238C01CC";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Apple-Mail=_37420EF0-273E-43F4-97D0-62F6238C01CC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Oct 22, 2019, at 2:44 PM, Mark Salyzyn <salyzyn@android.com> wrote:
>=20
> Replace arguments for get and set xattr methods, and __vfs_getxattr
> and __vfs_setaxtr functions with a reference to the following now
> common argument structure:
>=20
> struct xattr_gs_args {
> =09struct dentry *dentry;
> =09struct inode *inode;
> =09const char *name;
> =09union {
> =09=09void *buffer;
> =09=09const void *value;
> =09};
> =09size_t size;
> =09int flags;
> };

As part of this change (which is touching all of the uses of these
fields anyway) it would be useful to give these structure fields a
prefix like "xga_" so that they can be easily found with tags.
Otherwise, there are so many different "dentry" and "inode" fields
in various structures that it is hard to find the right one.

> #define __USE_KERNEL_XATTR_DEFS
>=20
> -#define XATTR_CREATE=090x1=09/* set value, fail if attr already exists *=
/
> -#define XATTR_REPLACE=090x2=09/* set value, fail if attr does not exist =
*/
> +#define XATTR_CREATE=09 0x1=09/* set value, fail if attr already exists =
*/
> +#define XATTR_REPLACE=09 0x2=09/* set value, fail if attr does not exist=
 */
> +#ifdef __KERNEL__ /* following is kernel internal, colocated for mainten=
ance */
> +#define XATTR_NOSECURITY 0x4=09/* get value, do not involve security che=
ck */
> +#endif

Now that these arguments are separated out into their own structure,
rather than using "int flags" (there are a million different flags in
the kernel and easily confused) it would be immediately clear *which*
flags are used here with a named enum, like:

enum xattr_flags {
=09XATTR_CREATE=09=3D 0x1,=09/* set value, fail if attr already exists */
=09XATTR_REPLACE=09=3D 0x2,=09/* set value, fail if attr does not exist */
#ifdef __KERNEL__ /* following is kernel internal, colocated for maintenanc=
e */
=09XATTR_NOSECURITY=3D 0x4,  /* get value, do not involve security check */
#endif
};

and use this in the struct like:

struct xattr_gs_args {
=09struct dentry=09*xga_dentry;
=09struct inode=09*xga_inode;
=09const char=09*xga_name;
=09union {
=09=09void=09=09*xga_buffer;
=09=09const void=09*xga_value;
=09};
=09size_t=09=09 xga_size;
=09enum xattr_flags xga_flags;
};

Beyond the benefit for the reader to understand the code better, this
can also allow the compiler to warn if incorrect values are being
assigned to this field.

Cheers, Andreas






--Apple-Mail=_37420EF0-273E-43F4-97D0-62F6238C01CC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAl2vfyEACgkQcqXauRfM
H+AxqxAAq6h17WEPF6r1UpAZIwUiPfdUH5qvEj5YwdktQwWuj4vM4AD1SnRYnDv2
erszJKsHxSS8RBP18hvIK3TC7Z1TwOPYxRcZb1KRnxX0TthhtHTNL103RmQvUvKm
8KjV2ZmRZAlgrvw09BGHJF4f4ina+Ua1AQsIg7l+6eGjBHJ3Nvjmv3M/Eca3Y9Gx
eWYOM5vlA7+eVqKpCEyQ+/EN5lhBOWA+qsQhfEyPjSns/VsVae7bWkUrZSIRHpk9
i7HCwOkDj9cmfU4iZ34JePW8dtqHfoq3ECMUvsO681CznbyWB7yDnmX+UL8OFw2s
Vj2n0fIHc/r3SJ87LF/k5JhjWaYM4rCM+1+uzXmukWQWXIU2U2vkLdAPkyibo6nq
5/Z98+GzWMwnP9esRhIM1lAf2Q0QQ/Bmmz5/2rwCEYpleEKInHDZyJ3ddSCC9mxQ
+bf/9EeqBVd7b2R8rQLNcrY9R5zewIE+NovyaCcz71H6lyQ/NwfAAlUrjXN6zjGo
aZYq3D2plzK5PnJwZrmarfiI2Qtge9h2sbFNX2dRT6oLeZNzv/rAx/8AueYIcGjb
bPlf+rGFqzCVPkUQFPYqlsa/oEqUTnmr+6p8FvKO8DJhdVZEuOn/vJZV4e903hHl
VURWEhW1Djzh/zWJVrNeOQRk+0KBXXfgvZ9nHpMRbX0xESTU+cY=
=8Giq
-----END PGP SIGNATURE-----

--Apple-Mail=_37420EF0-273E-43F4-97D0-62F6238C01CC--

