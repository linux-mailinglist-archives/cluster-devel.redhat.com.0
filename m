Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 537C81F3AD1
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jun 2020 14:44:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591706639;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=PolqWaPncacreaFQkLQeK4eYows7vt0oMjkGhIJ+i+o=;
	b=L7lNjy6OhwXlbn/uE7oBH9bThhbBzivdcwCxPQwEI6tJ+KpYUhJzjyWpkw91a6e5D7tDqp
	bHg6aYihR/e/RbgIgnNSaV2u4b/aYkljPt3iaoDBNDSAr1ucjGuSveUt36/YRjcUIpAks3
	Kd0pNDTO+raBQ1nTspGYnV4MXdxIo4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-8pbce9P3OmqXPAL04iZmYQ-1; Tue, 09 Jun 2020 08:43:57 -0400
X-MC-Unique: 8pbce9P3OmqXPAL04iZmYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60A53801504;
	Tue,  9 Jun 2020 12:43:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48FEF768C1;
	Tue,  9 Jun 2020 12:43:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCA14B349D;
	Tue,  9 Jun 2020 12:43:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059Chp19029776 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 08:43:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9FC572029F61; Tue,  9 Jun 2020 12:43:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DB112026971
	for <cluster-devel@redhat.com>; Tue,  9 Jun 2020 12:43:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20B0518A667B
	for <cluster-devel@redhat.com>; Tue,  9 Jun 2020 12:43:49 +0000 (UTC)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
	[209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-183-Bwwn90qFMbSKHYE0EJgEWA-1; Tue, 09 Jun 2020 08:43:47 -0400
X-MC-Unique: Bwwn90qFMbSKHYE0EJgEWA-1
Received: by mail-ot1-f69.google.com with SMTP id 88so9371221otw.21
	for <cluster-devel@redhat.com>; Tue, 09 Jun 2020 05:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PolqWaPncacreaFQkLQeK4eYows7vt0oMjkGhIJ+i+o=;
	b=qEexRpJ0Z5tPed/1Tvyg3jVSjMy/t5GhqFRmBECbYTG5lmrFpDT6+4S4713Xun8bbk
	DcUyuWpG4ZD5YbZf4KIpCBaTR0/itSXFDKy6mF+QQQk+Gek1zDejAAMgGdZ9JfxsslRi
	Ayxi2lTJJ/w/Ckr7oaJzAgP0wfrpXz4EdvhOgU8yl1krvTtCJOIpDrSH0LWboswu/Web
	eIuNynT10PEOPmtJLQ74KUVKtQBW5I2u5RWYKdaIZTSHH8GxVdmRoFr0mvsPXuvipiTk
	xKRjSTf8QyeG7tFJwTEOgKyrzRcdV0hPwQzrSIsjKhDlMdXF/iXtq3MEE/Y43RAU8Gal
	d5Ng==
X-Gm-Message-State: AOAM530qgqj0t3W5a32Q8EQKOg34JkT1bX/87ogtywq/nDrXKlLqEGIW
	dUmtosr/a/S1c8IpGT7JmXUVsL4VD1+YeE7xDWTowrkJ6T5eu+qF3e3X/oYYGRzA2zmJNGRUA48
	v0k6+gMijxNcbUmR6aeVLb+5VMEznk67vDHa0xA==
X-Received: by 2002:a4a:e049:: with SMTP id v9mr7235131oos.22.1591706626777;
	Tue, 09 Jun 2020 05:43:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxm8QU5lmc/wATbPfi7IEoSihmCNXzOonsL6S/LfF9P72qXu2fNTREVLk7nLE6VQQjUNCzuqJiacOm/4Eo9WWQ=
X-Received: by 2002:a4a:e049:: with SMTP id v9mr7235106oos.22.1591706626474;
	Tue, 09 Jun 2020 05:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200609120555.GA52680@mwanda>
In-Reply-To: <20200609120555.GA52680@mwanda>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 9 Jun 2020 14:43:35 +0200
Message-ID: <CAHc6FU4qJ6oG_BAzauqrcDd0EWSWeYyeup18f37dhuAyVhv_Eg@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [bug report] gfs2: Move inode generation number
	check into gfs2_inode_lookup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Tue, Jun 9, 2020 at 2:06 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Hello Andreas Gruenbacher,
>
> The patch b66648ad6dcf: "gfs2: Move inode generation number check
> into gfs2_inode_lookup" from Jan 15, 2020, leads to the following
> static checker warning:
>
>         fs/gfs2/inode.c:227 gfs2_inode_lookup()
>         warn: passing zero to 'ERR_PTR'
>
> fs/gfs2/inode.c
>    112   * If @type is DT_UNKNOWN, the inode type is fetched from disk.
>    113   *
>    114   * If @blktype is anything other than GFS2_BLKST_FREE (which is used as a
>    115   * placeholder because it doesn't otherwise make sense), the on-disk block type
>    116   * is verified to be @blktype.
>    117   *
>    118   * When @no_formal_ino is non-zero, this function will return ERR_PTR(-ESTALE)
>    119   * if it detects that @no_formal_ino doesn't match the actual inode generation
>    120   * number.  However, it doesn't always know unless @type is DT_UNKNOWN.
>    121   *
>    122   * Returns: A VFS inode, or an error
>                     ^^^^^^^^^^^^^^^^^^^^^^^^
> The comments imply this does not return NULL.
>
>    123   */
>    124
>    125  struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
>    126                                  u64 no_addr, u64 no_formal_ino,
>    127                                  unsigned int blktype)
>    128  {
>    129          struct inode *inode;
>    130          struct gfs2_inode *ip;
>    131          struct gfs2_glock *io_gl = NULL;
>    132          struct gfs2_holder i_gh;
>    133          int error;
>    134
>    135          gfs2_holder_mark_uninitialized(&i_gh);
>    136          inode = gfs2_iget(sb, no_addr);
>    137          if (!inode)
>    138                  return ERR_PTR(-ENOMEM);
>    139
>    140          ip = GFS2_I(inode);
>    141
>    142          if (inode->i_state & I_NEW) {
>                     ^^^^^^^^^^^^^^^^^^^^^^
> We take this path.
>
>    143                  struct gfs2_sbd *sdp = GFS2_SB(inode);
>    144
>    145                  error = gfs2_glock_get(sdp, no_addr, &gfs2_inode_glops, CREATE, &ip->i_gl);
>    146                  if (unlikely(error))
>    147                          goto fail;
>    148                  flush_delayed_work(&ip->i_gl->gl_work);
>    149
>    150                  error = gfs2_glock_get(sdp, no_addr, &gfs2_iopen_glops, CREATE, &io_gl);
>    151                  if (unlikely(error))
>    152                          goto fail;
>    153
>    154                  if (type == DT_UNKNOWN || blktype != GFS2_BLKST_FREE) {
>    155                          /*
>    156                           * The GL_SKIP flag indicates to skip reading the inode
>    157                           * block.  We read the inode with gfs2_inode_refresh
>    158                           * after possibly checking the block type.
>    159                           */
>    160                          error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE,
>    161                                                     GL_SKIP, &i_gh);
>    162                          if (error)
>    163                                  goto fail;
>    164
>    165                          error = -ESTALE;
>    166                          if (no_formal_ino &&
>    167                              gfs2_inode_already_deleted(ip->i_gl, no_formal_ino))
>    168                                  goto fail;
>    169
>    170                          if (blktype != GFS2_BLKST_FREE) {
>    171                                  error = gfs2_check_blk_type(sdp, no_addr,
>    172                                                              blktype);
>    173                                  if (error)
>    174                                          goto fail;
>    175                          }
>    176                  }
>    177
>    178                  glock_set_object(ip->i_gl, ip);
>    179                  set_bit(GIF_INVALID, &ip->i_flags);
>    180                  error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT, &ip->i_iopen_gh);
>    181                  if (unlikely(error))
>    182                          goto fail;
>    183                  gfs2_cancel_delete_work(ip->i_iopen_gh.gh_gl);
>    184                  glock_set_object(ip->i_iopen_gh.gh_gl, ip);
>    185                  gfs2_glock_put(io_gl);
>    186                  io_gl = NULL;
>    187
>    188                  /* Lowest possible timestamp; will be overwritten in gfs2_dinode_in. */
>    189                  inode->i_atime.tv_sec = 1LL << (8 * sizeof(inode->i_atime.tv_sec) - 1);
>    190                  inode->i_atime.tv_nsec = 0;
>    191
>    192                  if (type == DT_UNKNOWN) {
>    193                          /* Inode glock must be locked already */
>    194                          error = gfs2_inode_refresh(GFS2_I(inode));
>    195                          if (error)
>    196                                  goto fail;
>    197                  } else {
>    198                          ip->i_no_formal_ino = no_formal_ino;
>    199                          inode->i_mode = DT2IF(type);
>    200                  }
>    201
>    202                  if (gfs2_holder_initialized(&i_gh))
>    203                          gfs2_glock_dq_uninit(&i_gh);
>    204
>    205                  gfs2_set_iop(inode);
>    206          }
>    207
>    208          if (no_formal_ino && ip->i_no_formal_ino &&
>    209              no_formal_ino != ip->i_no_formal_ino) {
>    210                  if (inode->i_state & I_NEW)
>    211                          goto fail;
>                                 ^^^^^^^^^
> "error" is zero here.
>
>    212                  iput(inode);
>    213                  return ERR_PTR(-ESTALE);
>    214          }
>    215
>    216          if (inode->i_state & I_NEW)
>    217                  unlock_new_inode(inode);
>    218
>    219          return inode;
>    220
>    221  fail:
>    222          if (io_gl)
>    223                  gfs2_glock_put(io_gl);
>    224          if (gfs2_holder_initialized(&i_gh))
>    225                  gfs2_glock_dq_uninit(&i_gh);
>    226          iget_failed(inode);
>    227          return ERR_PTR(error);
>                                ^^^^^
> Leading to a NULL return.  It doesn't look like the caller checks for
> NULL so it might lead to an Oops.

Right, that's a bug. I've pushed a fix to
https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
for-next.

Thanks,
Andreas

>    228  }
>
> regards,
> dan carpenter

