Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC1528177
	for <lists+cluster-devel@lfdr.de>; Thu, 23 May 2019 17:43:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1DD17C072269;
	Thu, 23 May 2019 15:42:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E7A619695;
	Thu, 23 May 2019 15:42:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B95911806B14;
	Thu, 23 May 2019 15:42:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4NFfRtV010482 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 11:41:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B9E2A60C9E; Thu, 23 May 2019 15:41:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B385D60BF3
	for <cluster-devel@redhat.com>; Thu, 23 May 2019 15:41:27 +0000 (UTC)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
	[209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 82CEF4C38F
	for <cluster-devel@redhat.com>; Thu, 23 May 2019 15:41:27 +0000 (UTC)
Received: by mail-ot1-f72.google.com with SMTP id f18so3028668otf.22
	for <cluster-devel@redhat.com>; Thu, 23 May 2019 08:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HfZh3S4hBYdKCLPnJlarCFAoZRZSpRIgODFSHVoESqI=;
	b=UfdY2qiPdfi4PmnpWZIoGOYmWjg674wJsscQ5kBanuCqUYI+KiFru0mxfSNf2ctNMM
	NnszRkTRtDTHEXzK+sHZ+t/c3tPLABtEmqVVLOhY6XFpMnWlib2IczgDXtTJSROxGnOa
	oBlS2jRd+gPukJVjvExRTZZNcmMjFeE36WtrS+OS/mhMRCIuB2DffMtqP/G9GCL9X5b+
	lpzy3HOvRqNUOY8NJYQBR5cdA97JCGn085qEGIkngh+vX2SXPcP4LqDlKcRgedHhzsH8
	rM5fhSoQSpiioJ+x+ANA1tuxaDAZiTefXKmyeLfRhusOsoN5kyhZ4+aOdXKGKNea2h0t
	neqA==
X-Gm-Message-State: APjAAAUju2Ge+cYJ4SN+Aj4ZSBChnBOiPm1uoQEBkuTk19gD1T3eqLXb
	OTyxTfWNn1bw/FVrfdNuuzCLK5UvAqGLYYonkSAwz5XoF2M9RRo+TDgULansF77mARKzBfQK0K0
	UoDHBSRGU944lWW6bNmBKySG9mNOB9Tq8EJNxBg==
X-Received: by 2002:a9d:4611:: with SMTP id y17mr59003359ote.297.1558626086453;
	Thu, 23 May 2019 08:41:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxTw3Jd2xC9eedVXTj5DxtLAL8WOxKvOkgToHLGGmKyVMaUJXxNp2B2EOjwPXQDbfD7fzA04MNbfxs+3UD2xpw=
X-Received: by 2002:a9d:4611:: with SMTP id y17mr59003331ote.297.1558626085906;
	Thu, 23 May 2019 08:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <2e25e0e6-d192-cb50-ce26-787fbf932477@citrix.com>
	<792f3369-e2cf-67a4-05ed-dd3a1eba8634@citrix.com>
	<CAHc6FU79vcvt95vHn-Je-T7OkeDVi=H8ywTBS5PnU=onJOan9w@mail.gmail.com>
In-Reply-To: <CAHc6FU79vcvt95vHn-Je-T7OkeDVi=H8ywTBS5PnU=onJOan9w@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 23 May 2019 17:41:14 +0200
Message-ID: <CAHc6FU65+oPR0ArHTXzemVi6se9+6nE9G-1Zy9CaM3NZpr_x2g@mail.gmail.com>
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: 8bit
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x4NFfRtV010482
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Mark Syms <Mark.Syms@citrix.com>
Subject: Re: [Cluster-devel] GFS2 filesystem corruption when mkfs block size
 (4k) does not match blockdevice blocksize (512 bytes)
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 23 May 2019 15:43:14 +0000 (UTC)

Hi Edwin,

On Wed, 27 Mar 2019 at 01:13, Andreas Gruenbacher <agruenba@redhat.com> wrote:
> Hi Edwin,
>
> On Mon, 25 Mar 2019 at 20:07, Edwin Török <edvin.torok@citrix.com> wrote:
> > On 20/03/2019 15:54, Edwin Török wrote:
> > > Hello,
> > >
> > > The patch below to xfstests reliably reproduces the filesystem corruption on a 4.19 kernel.
> >
> > I've also reproduced this on CentOS 7.6:
> > [ 2565.093062] Buffer I/O error on dev dm-5, logical block 123761, lost async page write
> > [ 2565.307581] GFS2: fsid=dm-5.0: fatal: invalid metadata block
> > GFS2: fsid=dm-5.0:   bh = 123761 (magic number)
> > GFS2: fsid=dm-5.0:   function = gfs2_meta_indirect_buffer, file = fs/gfs2/meta_io.c, line = 428
> > [ 2565.307641] GFS2: fsid=dm-5.0: about to withdraw this file system
> > [ 2565.307706] GFS2: fsid=dm-5.0: withdrawn
> > [ 2565.307737] CPU: 0 PID: 61453 Comm: ls Kdump: loaded Not tainted 3.10.0-957.10.1.el7.x86_64 #1
> > [ 2565.307772] Hardware name: Xen HVM domU, BIOS 4.7.6-6.3 08/24/2018
> >
> > See below for the script that I used to do it, 100% reproducible and takes only a few minutes to reproduce.
> >
> > The problem here seems to be that the metadata block encountered some I/O error, wrote an incomplete block
> > (writes are atomic only at 512 byte level, not 4k), and later on GFS2 tried to read back the now corrupt metadata block.
> >
> > I've also been experimenting with a patch to make GFS2 withdraw sooner, before it actually tries to read back the corrupted block,
> > but then of course it still fails when mounting the filesystem again, when it detects the corrupt metadata block.
> > I would've thought that a journal replay on mount would fix this, i.e. try to write out the metadata block again and succeed,
> > but I'm not convinced the journal still contains the metadata block entry because the I/O error here is all asynchronous.
>
> when the filesystem is withdrawn and unmounted, and then either
> re-mounted or fsck'ed, it's pretty clear that the journal needs to be
> replayed. If that doesn't happen, and it didn't at least in my local
> testing, it's no surprise that partially written blocks will lead to
> all kinds of problems. This is an area that Bob has spent a lot of
> time looking into recently. He has found and fixed several bugs, but
> things are still not working entirely correctly. I'll try to help Bob
> with these patches so that we can get at least the initial fixes out
> the door as soon as possible.

Bob has been through several iterations of his recovery patch queue in
the meantime, squashing one bug after the other. This process seems to
be coming to an end slowly, so you may want to try out the patches Bob
has posted to cluster-devel today. A version of that, with two more
cosmetic cleanups, can be found on the for-next.recovery7f branch of
the gfs2 repository.

> > While looking at this I also discovered that gfs2_write_jdata_pagevec has some copy/pasted code from page-writeback.c that is missing
> > https://github.com/torvalds/linux/commit/3fa750dcf29e8606e3969d13d8e188cc1c0f511d#diff-f9a62819096a044efc553c77d4f6fdbb, but that doesn't seem to be used by default.
> >
> >
> > Do you have some thoughts/suggestions on how to proceed here?
> >
> > diff --git i/fs/gfs2/meta_io.c w/fs/gfs2/meta_io.c
> > index 868caa0..39c1030 100644
> > --- i/fs/gfs2/meta_io.c
> > +++ w/fs/gfs2/meta_io.c
> > @@ -33,6 +33,17 @@
> >  #include "util.h"
> >  #include "trace_gfs2.h"
> >
> > +static void gfs2_async_end_io(struct buffer_head *bh, int uptodate)
> > +{
> > +       end_buffer_async_write(bh, uptodate);
> > +       if (!uptodate) {
> > +               struct address_space *mapping = bh->b_page->mapping;
> > +               struct gfs2_sbd *sdp = gfs2_mapping2sbd(mapping);
> > +               gfs2_io_error_bh_wd(sdp, bh);
> > +               gfs2_lm_withdraw(sdp, NULL);
> > +       }
> > +}
> > +
> >  static int gfs2_aspace_writepage(struct page *page, struct writeback_control *wbc)
> >  {
> >         struct buffer_head *bh, *head;
> > @@ -63,6 +74,7 @@ static int gfs2_aspace_writepage(struct page *page, struct writeback_control *wb
> >                 }
> >                 if (test_clear_buffer_dirty(bh)) {
> >                         mark_buffer_async_write(bh);
> > +                       bh->b_end_io = gfs2_async_end_io;
> >                 } else {
> >                         unlock_buffer(bh);
> >                 }
> >
> > The script to reproduce the issue on CentOS:
> > #/bin/sh
> > set -eu
> > SIZE=1G
> > # XFSTESTS=https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/
> > XFSTESTS=https://github.com/edwintorok/xfstests.git
> >
> > sudo yum install -y epel-release
> > sudo yum install -y acl attr automake bc dump e2fsprogs fio gawk gcc indent libtool make psmisc quota sed xfsdump xfsprogs libacl-devel libattr-devel libaio-devel libuuid-devel xfsprogs-devel python sqlite git gfs2-utils
> > test -d xfstests-dev || git clone "${XFSTESTS}" xfstests-dev && make -C xfstests-dev -j8
> > cd xfstests-dev
> >
> > SCRATCH_FILE=scratch-file-$(date +%s)
> > truncate --size "${SIZE}" "${SCRATCH_FILE}"
> > SCRATCH_DEV=$(losetup --show -f "${SCRATCH_FILE}")
> >
> > TEST_FILE=test-file-$(date +%s)
> > truncate --size "${SIZE}" "${TEST_FILE}"
> > TEST_DEV=$(losetup --show -f "${TEST_FILE}")
> > TEST_DIR=/mnt/xfstests-test
> > SCRATCH_MNT=/mnt/xfstests-scratch
> > mkdir -p "${TEST_DIR}" "${SCRATCH_MNT}"
> >
> > cat <<EOF >local.config
> > export SCRATCH_DEV=$SCRATCH_DEV
> > export TEST_DEV=$TEST_DEV
> > export TEST_DIR=$TEST_DIR
> > export SCRATCH_MNT=$SCRATCH_MNT
> > EOF
> >
> > umount ${TEST_DIR} || true
> > wipefs -a -f ${TEST_DEV}
> > mkfs.gfs2 -O -p lock_nolock ${TEST_DEV}
> >
> > ./setup
> >
> > test -f tests/generic/536 && ./check generic/536
> >
> > ./check generic/347
> >
> > losetup -d "${TEST_DEV}"
> > losetup -d "${SCRATCH_DEV}"
>
> I could reproduce filesystem inconsistency with this script, thanks.
>
> > >
> > > In our lab we've found that if multiple iSCSI connection errors are
> > > detected (without completely loosing the iSCSI connection) then the GFS2
> > > filesystem becomes corrupt.
> > > The connection errors occured very likely due to network congestion (the iSCSI target is running on a 10Gbps network,
> > > but the test VM had only a 1Gbps network connection to it). Nevertheless networking issues shouldn't cause corruption.
> > >
> > > Even after rebooting the host and remounting the filesystem has immediately withdrawn itself
> > > when stating files. Sometimes fsck.gfs2 is able to fix it, but not always.
>
> As mentioned above, I assume that fsck.gfs2 didn't replay the journal.
> After a withdraw caused by a metadata write error, the journal will
> always have to be replayed. This replaying can be done by fsck.gfs2,
> when remounting the filesystem, or by another node that still has the
> filesystem mounted after the withdraw. This is more likely a bug in
> the withdraw code than in fsck.gfs2. (There may be bugs in the code
> for recovering foreign journals as well, but in this case, that code
> doesn't trigger.)
>
> > > Tim Smith has found that using matching blocksizes for GFS2 and the underlying blockdevice avoids the problem
> > > (running the testcase below for 30m in a loop does not reproduce the issue anymore).
> > > This discovery was made after careful reading of the fsck.gfs2 manpage, which states:
> > > "The first step to ensuring a healthy file system is the selec‐
> > > tion of reliable hardware (i.e. storage systems that will write complete blocks - even in the event of power failure)."
>
> It's no surprise that matching block sizes will reduce the amount of
> damage in the filesystem, and that that will make fsck.gfs2 succeed
> more often. If the journal isn't replayed, we'll still see metadata
> inconsistencies whenever the metadata changes affect more than one
> block at once, though.
>
> For all I can tell, the above statement in the fsck.gfs2(8) man page
> is inaccurate and out of date, and should be removed: there has always
> been a some checksumming in gfs2, but in commit c1696fb85d33 ("GFS2:
> Introduce new gfs2_log_header_v2") in 4.16, we have strengthened that
> checksumming so that journal corruption should really become pretty
> rare. Based on that, as long as the journal is replayed in the right
> circumstances, metadata corruption should become quite unlikely. So
> I'm pretty sure what we're missing here is journal replay.
>
> > > By default GFS2 uses a blocksize of 4k, and typically the devices in our lab have a block size of 512 bytes, therefore
> > > there are no atomicity guarantees on a 4k write: you may indeed get an incomplete write of 512, 1024, etc. bytes
> > >
> > > We'd like your opinion on two questions:
> > > 1. We believe that mkfs.gfs2 in gfs2-utils should be updated to query the underlying blockdevice for its blocksize and use that by default instead of 4k,
> > > and warn on a mismatch if you manually specify a blocksize. Also update the manpage of mkfs.gfs2 to state this.
> > > Is this the right approach, i.e. would such a patch be acceptable upstream if we prepare it?
> >
> > We've tried this and it comes with a massive performance cost, in some cases fio has shown 5x less IOPS (down to 20000 from 80000).
>
> Yes, even block devices that support a 512-byte logical sector size
> often emulate that on top of bigger sectors, which just cannot be
> fast. In addition, gfs2 is a block based filesystem (as opposed to
> extent based filesystems), so small block sizes mean a lot more
> overhead.
>
> > Best regards,
> > --Edwin
> >
> > >
> > > 2. Can the code be made more robust to cope with the incomplete writes?
> > > (e.g. can it throw away the bad journal entries, or replay the journal in such a way that it treats the underlying blockdevice's blocksize as the unit of atomicity
> > > instead of the gfs2 block size?)
> > > We're aware of your hard work on withdraw corruption https://www.redhat.com/archives/cluster-devel/2019-February/msg00077.html, would these patches help with this issue?
> > >
> > > Ideally we'd like to fix both issues (use matching blocksizes for newly created filesystems, and fix the possibility of corruption for the benefit of those whom already
> > > created their GFS2 filesystem with the default blocksize).
> > >
> > >
> > > The initial withdraw looks like this:
> > > Mar 20 15:10:29 localhost kernel: [13654.281665] Buffer I/O error on dev dm-4, logical block 431236, lost async page write
> > > Mar 20 15:10:29 localhost kernel: [13654.281795] gfs2: fsid=dm-4.0: fatal: invalid metadata block
> > > Mar 20 15:10:29 localhost kernel: [13654.281795]   bh = 431236 (magic number)
> > > Mar 20 15:10:29 localhost kernel: [13654.281795]   function = gfs2_meta_indirect_buffer, file = fs/gfs2/meta_io.c, line = 419
> > > Mar 20 15:10:29 localhost kernel: [13654.281834] gfs2: fsid=dm-4.0: about to withdraw this file system
> > > Mar 20 15:10:29 localhost kernel: [13654.281884] gfs2: fsid=dm-4.0: withdrawn
> > > Mar 20 15:10:29 localhost kernel: [13654.281894] CPU: 6 PID: 20880 Comm: xfs_io Tainted: G           O      4.19.0+1 #1
> > > Mar 20 15:10:29 localhost kernel: [13654.281896] Hardware name: Dell Inc. PowerEdge R415/0GXH08, BIOS 1.2.5 03/16/2011
> > > Mar 20 15:10:29 localhost kernel: [13654.281897] Call Trace:
> > > Mar 20 15:10:29 localhost kernel: [13654.281916]  dump_stack+0x5a/0x73
> > > Mar 20 15:10:29 localhost kernel: [13654.281941]  gfs2_lm_withdraw+0x125/0x1a0 [gfs2]
> > > Mar 20 15:10:29 localhost kernel: [13654.281956]  ? gfs2_meta_read+0x22d/0x2d0 [gfs2]
> > > Mar 20 15:10:29 localhost kernel: [13654.281969]  gfs2_meta_check_ii+0x2b/0x40 [gfs2]
> > > Mar 20 15:10:29 localhost kernel: [13654.281981]  gfs2_meta_indirect_buffer+0x119/0x130 [gfs2]
> > > Mar 20 15:10:29 localhost kernel: [13654.281993]  gfs2_dirty_inode+0x107/0x230 [gfs2]
> > > Mar 20 15:10:29 localhost kernel: [13654.282006]  ? gfs2_dirty_inode+0x1bf/0x230 [gfs2]
> > > Mar 20 15:10:29 localhost kernel: [13654.282012]  __mark_inode_dirty+0x17c/0x360
> > > Mar 20 15:10:29 localhost kernel: [13654.282024]  gfs2_write_inode+0x11f/0x160 [gfs2]
> > > Mar 20 15:10:29 localhost kernel: [13654.282028]  __writeback_singl
> > > e_inode+0x26d/0x340
> > > Mar 20 15:10:29 localhost kernel: [13654.282031]  writeback_single_inode+0xb7/0x130
> > > Mar 20 15:10:29 localhost kernel: [13654.282033]  sync_inode_metadata+0x3d/0x60
> > > Mar 20 15:10:29 localhost kernel: [13654.282045]  gfs2_fsync+0xad/0x110 [gfs2]
> > > Mar 20 15:10:29 localhost kernel: [13654.282049]  do_fsync+0x38/0x60
> > > Mar 20 15:10:29 localhost kernel: [13654.282053]  __x64_sys_fsync+0x10/0x20
> > > Mar 20 15:10:29 localhost kernel: [13654.282057]  do_syscall_64+0x4e/0x100
> > > Mar 20 15:10:29 localhost kernel: [13654.282062]  entry_SYSCALL_64_after_hwfr
> > >
> > > After the remount:
> > > Mar 20 15:10:30 localhost kernel: [13655.529526] gfs2: fsid=dm-4.0: first mount done, others may mount
> > > Mar 20 15:10:30 localhost kernel: [13655.581457] gfs2: fsid=dm-4.0: fatal: invalid metadata block
> > > Mar 20 15:10:30 localhost kernel: [13655.581457]   bh = 431236 (magic number)
> > > Mar 20 15:10:30 localhost kernel: [13655.581457]   function = gfs2_meta_indirect_buffer, file = fs/gfs2/meta_io.c, line = 419
> > > Mar 20 15:10:30 localhost kernel: [13655.581498] gfs2: fsid=dm-4.0: about to withdraw this file system
> > > Mar 20 15:10:30 localhost kernel: [13655.581553] gfs2: fsid=dm-4.0: withdrawn
> > > Mar 20 15:10:30 localhost kernel: [13655.581563] CPU: 1 PID: 21117 Comm: ls Tainted: G           O      4.19.0+1 #1
> > > Mar 20 15:10:30 localhost kernel: [13655.581565] Hardware name: Dell Inc. PowerEdge R415/0GXH08, BIOS 1.2.5 03/16/2011
> > > Mar 20 15:10:30 localhost kernel: [13655.581567] Call Trace:
> > > Mar 20 15:10:30 localhost kernel: [13655.581586]  dump_stack+0x5a/0x73
> > > Mar 20 15:10:30 localhost kernel: [13655.581611]  gfs2_lm_withdraw+0x125/0x1a0 [gfs2]
> > > Mar 20 15:10:30 localhost kernel: [13655.581625]  ? gfs2_meta_read+0x22d/0x2d0 [gfs2]
> > > Mar 20 15:10:30 localhost kernel: [13655.581638]  gfs2_meta_check_ii+0x2b/0x40 [gfs2]
> > > Mar 20 15:10:30 localhost kernel: [13655.581650]  gfs2_meta_indirect_buffer+0x119/0x130 [gfs2]
> > > Mar 20 15:10:30 localhost kernel: [13655.581661]  gfs2_inode_refresh+0x31/0x280 [gfs2]
> > > Mar 20 15:10:30 localhost kernel: [13655.581673]  ? gfs2_inode_lookup+0x2a2/0x420 [gfs2]
> > > Mar 20 15:10:30 localhost kernel: [13655.581683]  inode_go_lock+0x6b/0xf0 [gfs2]
> > > Mar 20 15:10:30 localhost kernel: [13655.581693]  do_promote+0x158/0x290 [gfs2]
> > > Mar 20 15:10:30 localhost kernel: [13655.581703]  finish_xmote+0x14f/0x350 [gfs2]
> > > Mar 20 15:10:30 localhost kernel: [13655.581714]  do_xmote+0x1a0/0x200 [gfs2]
> > > Mar 20 15:10:30 localhost kernel: [13655.581724]  gfs2_glock_nq+0x1ad/0x410 [gfs2]
> > > Mar 20 15:10:30 localhost kernel: [13655.581736]  __gfs2_lookup+0x6e/0x130 [gfs2]
> > > Mar 20 15:10:30 localhost kernel: [13655.581748]  ? __gfs2_lookup+0x66/0x130 [gfs2]
> > > Mar 20 15:10:30 localhost kernel: [13655.581754]  __lookup_slow+0x94/0x140
> > > Mar 20 15:10:30 localhost kernel: [13655.581758]  lookup_slow+0x35/0x50
> > > Mar 20 15:10:30 localhost kernel: [13655.581761]  walk_component+0x15b/0x280
> > > Mar 20 15:10:30 localhost kernel: [13655.581764]  path_lookupat+0x6d/0x200
> > > Mar 20 15:10:30 localhost kernel: [13655.581767]  ? dput+0xa2/0xd0
> > > Mar 20 15:10:30 localhost kernel: [13655.581773]  ? cap_inode_getsecurity+0x8e/0x210
> > > Mar 20 15:10:30 localhost kernel: [13655.581776]  filename_lookup+0xab/0x140
> > > Mar 20 15:10:30 localhost kernel: [13655.581781]  ? __check_object_size+0x15d/0x1b0
> > > Mar 20 15:10:30 localhost kernel: [13655.581786]  ? strncpy_from_user+0x3e/0x150
> > > Mar 20 15:10:30 localhost kernel: [13655.581788]  ? getname_flags+0x49/0x180
> > > Mar 20 15:10:30 localhost kernel: [13655.581793]  vfs_statx+0x74/0xe0
> > > Mar 20 15:10:30 localhost kernel: [13655.581797]  __do_sys_newlstat+0x39/0x70
> > > Mar 20 15:10:30 localhost kernel: [13655.581801]  ? queued_spin_unlock+0x5/0x10
> > > Mar 20 15:10:30 localhost kernel: [13655.581803]  ? dput+0x63/0xd0
> > > Mar 20 15:10:30 localhost kernel: [13655.581807]  ? path_getxattr+0x6c/0xb0
> > > Mar 20 15:10:30 localhost kernel: [13655.581812]  do_syscall_64+0x4e/0x100
> > > Mar 20 15:10:30 localhost kernel: [13655.581817]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > > Mar 20 15:10:30 localhost kernel: [13655.581821] RIP: 0033:0x7fe91ef14635
> > >
> > >
> > > From 407a254c7b147c377ac02d326b76456278e36cb9 Mon Sep 17 00:00:00 2001
> > > From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
> > > Date: Wed, 20 Mar 2019 12:49:52 +0000
> > > Subject: [PATCH] tests/generic/536: intermittent I/O errors must not corrupt a
> > >  filesystem
> > > MIME-Version: 1.0
> > > Content-Type: text/plain; charset=UTF-8
> > > Content-Transfer-Encoding: 8bit
> > >
> > > Based on tests/generic/347.
> > > In our lab we've found that if multiple iSCSI connection errors are
> > > detected (without completely loosing the iSCSI connection) then the GFS2
> > > filesystem becomes corrupt.
> > > Add a test that explicitly checks for this by simulating I/O errors
> > > deterministically with dm-thin.
> > >
> > > Tim Smith has spotted that the root cause of the corruption in GFS2
> > > seems to be a difference in the default GFS2 block size (4k)
> > > and iSCSI block size (512 bytes) which breaks the requirements stated in fsck.gfs2.
> > >
> > > Although it is expected that a filesystem might report errors and
> > > unmount itself when it detects I/O errors, when those I/O errors are
> > > fixed and the filesystem is remounted it should not fail with a fatal
> > > assertion again.
> > >
> > > Signed-off-by: Edwin Török <edvin.torok@citrix.com>
> > > ---
> > >  common/dmthin         |  6 ++++
> > >  tests/generic/536     | 80 +++++++++++++++++++++++++++++++++++++++++++
> > >  tests/generic/536.out |  2 ++
> > >  tests/generic/group   |  1 +
> > >  4 files changed, 89 insertions(+)
> > >  create mode 100755 tests/generic/536
> > >  create mode 100644 tests/generic/536.out
> > >
> > > diff --git a/common/dmthin b/common/dmthin
> > > index 7946e9a7..28f2ef9c 100644
> > > --- a/common/dmthin
> > > +++ b/common/dmthin
> > > @@ -41,6 +41,12 @@ _dmthin_check_fs()
> > >       _check_scratch_fs $DMTHIN_VOL_DEV
> > >  }
> > >
> > > +_dmthin_cycle_mount()
> > > +{
> > > +     $UMOUNT_PROG $SCRATCH_MNT > /dev/null 2>&1
> > > +     _dmthin_mount
> > > +}
> > > +
> > >  # Set up a dm-thin device on $SCRATCH_DEV
> > >  #
> > >  # All arguments are optional, and in this order; defaults follows:
> > > diff --git a/tests/generic/536 b/tests/generic/536
> > > new file mode 100755
> > > index 00000000..08b94a21
> > > --- /dev/null
> > > +++ b/tests/generic/536
> > > @@ -0,0 +1,80 @@
> > > +#! /bin/bash
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +# Copyright (c) 2015 Red Hat, Inc.  All Rights Reserved.
> > > +#
> > > +# FS QA Test No. generic/536
> > > +#
> > > +# Test that intermittent IO errors during pwrite do not cause filesystem corruption
> > > +
> > > +seq=`basename $0`
> > > +seqres=$RESULT_DIR/$seq
> > > +echo "QA output created by $seq"
> > > +
> > > +here=`pwd`
> > > +tmp=/tmp/$$
> > > +
> > > +status=1     # failure is the default!
> > > +trap "_cleanup; exit \$status" 0 1 2 3 15
> > > +
> > > +BACKING_SIZE=$((500 * 1024 * 1024 / 512))    # 500M
> > > +VIRTUAL_SIZE=$((10 * $BACKING_SIZE))         # 5000M
> > > +GROW_SIZE=$((100 * 1024 * 1024 / 512))               # 100M
> > > +
> > > +_cleanup()
> > > +{
> > > +     _dmthin_cleanup
> > > +     rm -f $tmp.*
> > > +}
> > > +
> > > +_setup_thin()
> > > +{
> > > +     _dmthin_init $BACKING_SIZE $VIRTUAL_SIZE
> > > +     _dmthin_set_queue
> > > +     _mkfs_dev -b 512 $DMTHIN_VOL_DEV
> > > +     _dmthin_mount
> > > +}
> > > +
> > > +_workout()
> > > +{
> > > +     # Overfill it by a bit
> > > +     for I in `seq 1 500`; do
> > > +             $XFS_IO_PROG -f -c "pwrite -W 0 1M" $SCRATCH_MNT/file$I &>/dev/null
> > > +     done
> > > +
> > > +     sync
> > > +
> > > +     _dmthin_grow  $GROW_SIZE
> > > +
> > > +     # Write a little more, but don't fill
> > > +     for I in `seq 501 510`; do
> > > +             $XFS_IO_PROG -f -c "pwrite 0 1M" $SCRATCH_MNT/file$I &>/dev/null
> > > +     done
> > > +}
> > > +
> > > +# get standard environment, filters and checks
> > > +. ./common/rc
> > > +. ./common/dmthin
> > > +
> > > +_supported_fs generic
> > > +_supported_os Linux
> > > +_require_scratch_nocheck
> > > +_require_dm_target thin-pool
> > > +
> > > +_setup_thin
> > > +
> > > +# trigger IO errors, the filesystem may be remounted RO or withdrawn, this is expected
> > > +_workout
> > > +
> > > +# now remount the filesystem without triggering IO errors,
> > > +# and check that the filesystem is not corrupt
> > > +_dmthin_cycle_mount
> > > +# ls --color makes ls stat each file, which finds the corruption
> > > +ls --color=always $SCRATCH_MNT/ >/dev/null || _fail "Failed to list filesystem after remount"
> > > +ls --color=always $SCRATCH_MNT/ >/dev/null || _fail "Failed to list filesystem after remount"
> > > +ls --color=always $SCRATCH_MNT/ >/dev/null || _fail "Failed to list filesystem after remount"
> > > +_dmthin_cleanup
> > > +
> > > +echo "=== completed"
> > > +
> > > +status=0
> > > +exit
> > > diff --git a/tests/generic/536.out b/tests/generic/536.out
> > > new file mode 100644
> > > index 00000000..5140d261
> > > --- /dev/null
> > > +++ b/tests/generic/536.out
> > > @@ -0,0 +1,2 @@
> > > +QA output created by 536
> > > +=== completed
> > > diff --git a/tests/generic/group b/tests/generic/group
> > > index 78b9b45d..a346dfab 100644
> > > --- a/tests/generic/group
> > > +++ b/tests/generic/group
> > > @@ -538,3 +538,4 @@
> > >  533 auto quick attr
> > >  534 auto quick log
> > >  535 auto quick log
> > > +536 auto quick rw thin
> > >
>
> Thanks,
> Andreas

Cheers,
Andreas

