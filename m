Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 58DBD1AD78A
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Apr 2020 09:37:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587109060;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=FiBK8aCtFJGIhDoOgWcjhOaSBgPjc38ccOAuZvc+380=;
	b=Xvjg8UJgyV6OzVvQqFNuWu9qBiM8oc0i6WWpfEkKqUVbYsEjUc296FrjSfcuTQt2/Hl3Ds
	DtcSVqay+AT7TRV+HnykRdIh0/p0dVQ/BOyDbqQ8KDpt2Xghmt5jX8AffPG02eHgDl5cto
	l8crApqBlbLb4iVhRImhLlZEtrhdc2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-JP5DPyQLMsOSEY5Menp2LQ-1; Fri, 17 Apr 2020 03:37:20 -0400
X-MC-Unique: JP5DPyQLMsOSEY5Menp2LQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A974213F7;
	Fri, 17 Apr 2020 07:37:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F4455D9E2;
	Fri, 17 Apr 2020 07:37:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 037F01809567;
	Fri, 17 Apr 2020 07:37:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03H7b89B007751 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 17 Apr 2020 03:37:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A75BE103F284; Fri, 17 Apr 2020 07:37:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A290F103F282
	for <cluster-devel@redhat.com>; Fri, 17 Apr 2020 07:37:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5D818FF67E
	for <cluster-devel@redhat.com>; Fri, 17 Apr 2020 07:37:05 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-167-26nOOXrMNfSjcFs5AhFN6A-1; Fri, 17 Apr 2020 03:36:59 -0400
X-MC-Unique: 26nOOXrMNfSjcFs5AhFN6A-1
IronPort-SDR: YqZQjgpyLfIGzn9CTRAAiXm9lbUDgbLgq+v9btwBumjoAoBLP2VGtXJdJE/PF/t/DILBKUxpB8
	gD+cHJh7UWwg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	17 Apr 2020 00:36:57 -0700
IronPort-SDR: rLSy1FwlsTEll13YRbq9kk/qmaMudhVoSCb2LR6TQ7NT6TK8+NAVodCkvC0ZM3IcIAcWW5BzCU
	sbmbdLW+Pzjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; 
	d="gz'50?scan'50,208,50";a="246222555"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
	by fmsmga008.fm.intel.com with ESMTP; 17 Apr 2020 00:36:55 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
	(envelope-from <lkp@intel.com>)
	id 1jPLYU-0006yn-F3; Fri, 17 Apr 2020 15:36:54 +0800
Date: Fri, 17 Apr 2020 15:36:24 +0800
From: kbuild test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <202004171521.Z9s8gKSV%lkp@intel.com>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, kbuild-all@lists.01.org
Subject: [Cluster-devel] [gfs2:gfs2-iopen 12/12] fs/gfs2/util.c:126:3:
 error: implicit declaration of function 'gfs2_glock_dq_wait';
 did you mean 'gfs2_glock_nq_init'?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline

--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git=
 gfs2-iopen
head:   c748e1ec9bd20d71265a148042f6bc97ffc5f343
commit: c748e1ec9bd20d71265a148042f6bc97ffc5f343 [12/12] gfs2: Remove unuse=
d function gfs2_glock_dq_wait
config: s390-defconfig (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout c748e1ec9bd20d71265a148042f6bc97ffc5f343
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Ds390=20

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   fs/gfs2/util.c: In function 'signal_our_withdraw':
>> fs/gfs2/util.c:126:3: error: implicit declaration of function 'gfs2_gloc=
k_dq_wait'; did you mean 'gfs2_glock_nq_init'? [-Werror=3Dimplicit-function=
-declaration]
     126 |   gfs2_glock_dq_wait(&sdp->sd_journal_gh);
         |   ^~~~~~~~~~~~~~~~~~
         |   gfs2_glock_nq_init
   cc1: some warnings being treated as errors

vim +126 fs/gfs2/util.c

0d91061a372671a Bob Peterson 2019-02-18   92 =20
601ef0d52e96175 Bob Peterson 2020-01-28   93  static void signal_our_withdr=
aw(struct gfs2_sbd *sdp)
601ef0d52e96175 Bob Peterson 2020-01-28   94  {
601ef0d52e96175 Bob Peterson 2020-01-28   95  =09struct gfs2_glock *gl =3D =
sdp->sd_live_gh.gh_gl;
601ef0d52e96175 Bob Peterson 2020-01-28   96  =09struct inode *inode =3D sd=
p->sd_jdesc->jd_inode;
601ef0d52e96175 Bob Peterson 2020-01-28   97  =09struct gfs2_inode *ip =3D =
GFS2_I(inode);
601ef0d52e96175 Bob Peterson 2020-01-28   98  =09u64 no_formal_ino =3D ip->=
i_no_formal_ino;
601ef0d52e96175 Bob Peterson 2020-01-28   99  =09int ret =3D 0;
601ef0d52e96175 Bob Peterson 2020-01-28  100  =09int tries;
601ef0d52e96175 Bob Peterson 2020-01-28  101 =20
601ef0d52e96175 Bob Peterson 2020-01-28  102  =09if (test_bit(SDF_NORECOVER=
Y, &sdp->sd_flags))
601ef0d52e96175 Bob Peterson 2020-01-28  103  =09=09return;
601ef0d52e96175 Bob Peterson 2020-01-28  104 =20
601ef0d52e96175 Bob Peterson 2020-01-28  105  =09/* Prevent any glock dq un=
til withdraw recovery is complete */
601ef0d52e96175 Bob Peterson 2020-01-28  106  =09set_bit(SDF_WITHDRAW_RECOV=
ERY, &sdp->sd_flags);
601ef0d52e96175 Bob Peterson 2020-01-28  107  =09/*
601ef0d52e96175 Bob Peterson 2020-01-28  108  =09 * Don't tell dlm we're ba=
iling until we have no more buffers in the
601ef0d52e96175 Bob Peterson 2020-01-28  109  =09 * wind. If journal had an=
 IO error, the log code should just purge
601ef0d52e96175 Bob Peterson 2020-01-28  110  =09 * the outstanding buffers=
 rather than submitting new IO. Making the
601ef0d52e96175 Bob Peterson 2020-01-28  111  =09 * file system read-only w=
ill flush the journal, etc.
601ef0d52e96175 Bob Peterson 2020-01-28  112  =09 *
601ef0d52e96175 Bob Peterson 2020-01-28  113  =09 * During a normal unmount=
, gfs2_make_fs_ro calls gfs2_log_shutdown
601ef0d52e96175 Bob Peterson 2020-01-28  114  =09 * which clears SDF_JOURNA=
L_LIVE. In a withdraw, we must not write
601ef0d52e96175 Bob Peterson 2020-01-28  115  =09 * any UNMOUNT log header,=
 so we can't call gfs2_log_shutdown, and
601ef0d52e96175 Bob Peterson 2020-01-28  116  =09 * therefore we need to cl=
ear SDF_JOURNAL_LIVE manually.
601ef0d52e96175 Bob Peterson 2020-01-28  117  =09 */
601ef0d52e96175 Bob Peterson 2020-01-28  118  =09clear_bit(SDF_JOURNAL_LIVE=
, &sdp->sd_flags);
601ef0d52e96175 Bob Peterson 2020-01-28  119  =09if (!sb_rdonly(sdp->sd_vfs=
))
601ef0d52e96175 Bob Peterson 2020-01-28  120  =09=09ret =3D gfs2_make_fs_ro=
(sdp);
601ef0d52e96175 Bob Peterson 2020-01-28  121 =20
601ef0d52e96175 Bob Peterson 2020-01-28  122  =09/*
601ef0d52e96175 Bob Peterson 2020-01-28  123  =09 * Drop the glock for our =
journal so another node can recover it.
601ef0d52e96175 Bob Peterson 2020-01-28  124  =09 */
601ef0d52e96175 Bob Peterson 2020-01-28  125  =09if (gfs2_holder_initialize=
d(&sdp->sd_journal_gh)) {
601ef0d52e96175 Bob Peterson 2020-01-28 @126  =09=09gfs2_glock_dq_wait(&sdp=
->sd_journal_gh);
601ef0d52e96175 Bob Peterson 2020-01-28  127  =09=09gfs2_holder_uninit(&sdp=
->sd_journal_gh);
601ef0d52e96175 Bob Peterson 2020-01-28  128  =09}
601ef0d52e96175 Bob Peterson 2020-01-28  129  =09sdp->sd_jinode_gh.gh_flags=
 |=3D GL_NOCACHE;
601ef0d52e96175 Bob Peterson 2020-01-28  130  =09gfs2_glock_dq(&sdp->sd_jin=
ode_gh);
601ef0d52e96175 Bob Peterson 2020-01-28  131  =09if (test_bit(SDF_FS_FROZEN=
, &sdp->sd_flags)) {
601ef0d52e96175 Bob Peterson 2020-01-28  132  =09=09/* Make sure gfs2_unfre=
eze works if partially-frozen */
601ef0d52e96175 Bob Peterson 2020-01-28  133  =09=09flush_workqueue(gfs2_fr=
eeze_wq);
601ef0d52e96175 Bob Peterson 2020-01-28  134  =09=09atomic_set(&sdp->sd_fre=
eze_state, SFS_FROZEN);
601ef0d52e96175 Bob Peterson 2020-01-28  135  =09=09thaw_super(sdp->sd_vfs)=
;
601ef0d52e96175 Bob Peterson 2020-01-28  136  =09} else {
601ef0d52e96175 Bob Peterson 2020-01-28  137  =09=09wait_on_bit(&gl->gl_fla=
gs, GLF_DEMOTE, TASK_UNINTERRUPTIBLE);
601ef0d52e96175 Bob Peterson 2020-01-28  138  =09}
601ef0d52e96175 Bob Peterson 2020-01-28  139 =20
601ef0d52e96175 Bob Peterson 2020-01-28  140  =09/*
601ef0d52e96175 Bob Peterson 2020-01-28  141  =09 * holder_uninit to force =
glock_put, to force dlm to let go
601ef0d52e96175 Bob Peterson 2020-01-28  142  =09 */
601ef0d52e96175 Bob Peterson 2020-01-28  143  =09gfs2_holder_uninit(&sdp->s=
d_jinode_gh);
601ef0d52e96175 Bob Peterson 2020-01-28  144 =20
601ef0d52e96175 Bob Peterson 2020-01-28  145  =09/*
601ef0d52e96175 Bob Peterson 2020-01-28  146  =09 * Note: We need to be car=
eful here:
601ef0d52e96175 Bob Peterson 2020-01-28  147  =09 * Our iput of jd_inode wi=
ll evict it. The evict will dequeue its
601ef0d52e96175 Bob Peterson 2020-01-28  148  =09 * glock, but the glock dq=
 will wait for the withdraw unless we have
601ef0d52e96175 Bob Peterson 2020-01-28  149  =09 * exception code in glock=
_dq.
601ef0d52e96175 Bob Peterson 2020-01-28  150  =09 */
601ef0d52e96175 Bob Peterson 2020-01-28  151  =09iput(inode);
601ef0d52e96175 Bob Peterson 2020-01-28  152  =09/*
601ef0d52e96175 Bob Peterson 2020-01-28  153  =09 * Wait until the journal =
inode's glock is freed. This allows try locks
601ef0d52e96175 Bob Peterson 2020-01-28  154  =09 * on other nodes to be su=
ccessful, otherwise we remain the owner of
601ef0d52e96175 Bob Peterson 2020-01-28  155  =09 * the glock as far as dlm=
 is concerned.
601ef0d52e96175 Bob Peterson 2020-01-28  156  =09 */
601ef0d52e96175 Bob Peterson 2020-01-28  157  =09if (gl->gl_ops->go_free) {
601ef0d52e96175 Bob Peterson 2020-01-28  158  =09=09set_bit(GLF_FREEING, &g=
l->gl_flags);
601ef0d52e96175 Bob Peterson 2020-01-28  159  =09=09wait_on_bit(&gl->gl_fla=
gs, GLF_FREEING, TASK_UNINTERRUPTIBLE);
601ef0d52e96175 Bob Peterson 2020-01-28  160  =09}
601ef0d52e96175 Bob Peterson 2020-01-28  161 =20
601ef0d52e96175 Bob Peterson 2020-01-28  162  =09if (sdp->sd_lockstruct.ls_=
ops->lm_lock =3D=3D NULL) { /* lock_nolock */
601ef0d52e96175 Bob Peterson 2020-01-28  163  =09=09clear_bit(SDF_WITHDRAW_=
RECOVERY, &sdp->sd_flags);
601ef0d52e96175 Bob Peterson 2020-01-28  164  =09=09goto skip_recovery;
601ef0d52e96175 Bob Peterson 2020-01-28  165  =09}
601ef0d52e96175 Bob Peterson 2020-01-28  166  =09/*
601ef0d52e96175 Bob Peterson 2020-01-28  167  =09 * Dequeue the "live" gloc=
k, but keep a reference so it's never freed.
601ef0d52e96175 Bob Peterson 2020-01-28  168  =09 */
601ef0d52e96175 Bob Peterson 2020-01-28  169  =09gfs2_glock_hold(gl);
601ef0d52e96175 Bob Peterson 2020-01-28  170  =09gfs2_glock_dq_wait(&sdp->s=
d_live_gh);
601ef0d52e96175 Bob Peterson 2020-01-28  171  =09/*
601ef0d52e96175 Bob Peterson 2020-01-28  172  =09 * We enqueue the "live" g=
lock in EX so that all other nodes
601ef0d52e96175 Bob Peterson 2020-01-28  173  =09 * get a demote request an=
d act on it. We don't really want the
601ef0d52e96175 Bob Peterson 2020-01-28  174  =09 * lock in EX, so we send =
a "try" lock with 1CB to produce a callback.
601ef0d52e96175 Bob Peterson 2020-01-28  175  =09 */
601ef0d52e96175 Bob Peterson 2020-01-28  176  =09fs_warn(sdp, "Requesting r=
ecovery of jid %d.\n",
601ef0d52e96175 Bob Peterson 2020-01-28  177  =09=09sdp->sd_lockstruct.ls_j=
id);
601ef0d52e96175 Bob Peterson 2020-01-28  178  =09gfs2_holder_reinit(LM_ST_E=
XCLUSIVE, LM_FLAG_TRY_1CB | LM_FLAG_NOEXP,
601ef0d52e96175 Bob Peterson 2020-01-28  179  =09=09=09   &sdp->sd_live_gh)=
;
601ef0d52e96175 Bob Peterson 2020-01-28  180  =09msleep(GL_GLOCK_MAX_HOLD);
601ef0d52e96175 Bob Peterson 2020-01-28  181  =09/*
601ef0d52e96175 Bob Peterson 2020-01-28  182  =09 * This will likely fail i=
n a cluster, but succeed standalone:
601ef0d52e96175 Bob Peterson 2020-01-28  183  =09 */
601ef0d52e96175 Bob Peterson 2020-01-28  184  =09ret =3D gfs2_glock_nq(&sdp=
->sd_live_gh);
601ef0d52e96175 Bob Peterson 2020-01-28  185 =20
601ef0d52e96175 Bob Peterson 2020-01-28  186  =09/*
601ef0d52e96175 Bob Peterson 2020-01-28  187  =09 * If we actually got the =
"live" lock in EX mode, there are no other
601ef0d52e96175 Bob Peterson 2020-01-28  188  =09 * nodes available to repl=
ay our journal. So we try to replay it
601ef0d52e96175 Bob Peterson 2020-01-28  189  =09 * ourselves. We hold the =
"live" glock to prevent other mounters
601ef0d52e96175 Bob Peterson 2020-01-28  190  =09 * during recovery, then j=
ust dequeue it and reacquire it in our
601ef0d52e96175 Bob Peterson 2020-01-28  191  =09 * normal SH mode. Just in=
 case the problem that caused us to
601ef0d52e96175 Bob Peterson 2020-01-28  192  =09 * withdraw prevents us fr=
om recovering our journal (e.g. io errors
601ef0d52e96175 Bob Peterson 2020-01-28  193  =09 * and such) we still chec=
k if the journal is clean before proceeding
601ef0d52e96175 Bob Peterson 2020-01-28  194  =09 * but we may wait forever=
 until another mounter does the recovery.
601ef0d52e96175 Bob Peterson 2020-01-28  195  =09 */
601ef0d52e96175 Bob Peterson 2020-01-28  196  =09if (ret =3D=3D 0) {
601ef0d52e96175 Bob Peterson 2020-01-28  197  =09=09fs_warn(sdp, "No other =
mounters found. Trying to recover our "
601ef0d52e96175 Bob Peterson 2020-01-28  198  =09=09=09"own journal jid %d.=
\n", sdp->sd_lockstruct.ls_jid);
601ef0d52e96175 Bob Peterson 2020-01-28  199  =09=09if (gfs2_recover_journa=
l(sdp->sd_jdesc, 1))
601ef0d52e96175 Bob Peterson 2020-01-28  200  =09=09=09fs_warn(sdp, "Unable=
 to recover our journal jid %d.\n",
601ef0d52e96175 Bob Peterson 2020-01-28  201  =09=09=09=09sdp->sd_lockstruc=
t.ls_jid);
601ef0d52e96175 Bob Peterson 2020-01-28  202  =09=09gfs2_glock_dq_wait(&sdp=
->sd_live_gh);
601ef0d52e96175 Bob Peterson 2020-01-28  203  =09=09gfs2_holder_reinit(LM_S=
T_SHARED, LM_FLAG_NOEXP | GL_EXACT,
601ef0d52e96175 Bob Peterson 2020-01-28  204  =09=09=09=09   &sdp->sd_live_=
gh);
601ef0d52e96175 Bob Peterson 2020-01-28  205  =09=09gfs2_glock_nq(&sdp->sd_=
live_gh);
601ef0d52e96175 Bob Peterson 2020-01-28  206  =09}
601ef0d52e96175 Bob Peterson 2020-01-28  207 =20
601ef0d52e96175 Bob Peterson 2020-01-28  208  =09gfs2_glock_queue_put(gl); =
/* drop the extra reference we acquired */
601ef0d52e96175 Bob Peterson 2020-01-28  209  =09clear_bit(SDF_WITHDRAW_REC=
OVERY, &sdp->sd_flags);
601ef0d52e96175 Bob Peterson 2020-01-28  210 =20
601ef0d52e96175 Bob Peterson 2020-01-28  211  =09/*
601ef0d52e96175 Bob Peterson 2020-01-28  212  =09 * At this point our journ=
al is evicted, so we need to get a new inode
601ef0d52e96175 Bob Peterson 2020-01-28  213  =09 * for it. Once done, we n=
eed to call gfs2_find_jhead which
601ef0d52e96175 Bob Peterson 2020-01-28  214  =09 * calls gfs2_map_journal_=
extents to map it for us again.
601ef0d52e96175 Bob Peterson 2020-01-28  215  =09 *
601ef0d52e96175 Bob Peterson 2020-01-28  216  =09 * Note that we don't real=
ly want it to look up a FREE block. The
601ef0d52e96175 Bob Peterson 2020-01-28  217  =09 * GFS2_BLKST_FREE simply =
overrides a block check in gfs2_inode_lookup
601ef0d52e96175 Bob Peterson 2020-01-28  218  =09 * which would otherwise f=
ail because it requires grabbing an rgrp
601ef0d52e96175 Bob Peterson 2020-01-28  219  =09 * glock, which would fail=
 with -EIO because we're withdrawing.
601ef0d52e96175 Bob Peterson 2020-01-28  220  =09 */
601ef0d52e96175 Bob Peterson 2020-01-28  221  =09inode =3D gfs2_inode_looku=
p(sdp->sd_vfs, DT_UNKNOWN,
601ef0d52e96175 Bob Peterson 2020-01-28  222  =09=09=09=09  sdp->sd_jdesc->=
jd_no_addr, no_formal_ino,
601ef0d52e96175 Bob Peterson 2020-01-28  223  =09=09=09=09  GFS2_BLKST_FREE=
);
601ef0d52e96175 Bob Peterson 2020-01-28  224  =09if (IS_ERR(inode)) {
601ef0d52e96175 Bob Peterson 2020-01-28  225  =09=09fs_warn(sdp, "Reprocess=
ing of jid %d failed with %ld.\n",
601ef0d52e96175 Bob Peterson 2020-01-28  226  =09=09=09sdp->sd_lockstruct.l=
s_jid, PTR_ERR(inode));
601ef0d52e96175 Bob Peterson 2020-01-28  227  =09=09goto skip_recovery;
601ef0d52e96175 Bob Peterson 2020-01-28  228  =09}
601ef0d52e96175 Bob Peterson 2020-01-28  229  =09sdp->sd_jdesc->jd_inode =
=3D inode;
601ef0d52e96175 Bob Peterson 2020-01-28  230 =20
601ef0d52e96175 Bob Peterson 2020-01-28  231  =09/*
601ef0d52e96175 Bob Peterson 2020-01-28  232  =09 * Now wait until recovery=
 is complete.
601ef0d52e96175 Bob Peterson 2020-01-28  233  =09 */
601ef0d52e96175 Bob Peterson 2020-01-28  234  =09for (tries =3D 0; tries < =
10; tries++) {
7d9f9249580e05a Bob Peterson 2019-02-18  235  =09=09ret =3D check_journal_c=
lean(sdp, sdp->sd_jdesc, false);
601ef0d52e96175 Bob Peterson 2020-01-28  236  =09=09if (!ret)
601ef0d52e96175 Bob Peterson 2020-01-28  237  =09=09=09break;
601ef0d52e96175 Bob Peterson 2020-01-28  238  =09=09msleep(HZ);
601ef0d52e96175 Bob Peterson 2020-01-28  239  =09=09fs_warn(sdp, "Waiting f=
or journal recovery jid %d.\n",
601ef0d52e96175 Bob Peterson 2020-01-28  240  =09=09=09sdp->sd_lockstruct.l=
s_jid);
601ef0d52e96175 Bob Peterson 2020-01-28  241  =09}
601ef0d52e96175 Bob Peterson 2020-01-28  242  skip_recovery:
601ef0d52e96175 Bob Peterson 2020-01-28  243  =09if (!ret)
601ef0d52e96175 Bob Peterson 2020-01-28  244  =09=09fs_warn(sdp, "Journal r=
ecovery complete for jid %d.\n",
601ef0d52e96175 Bob Peterson 2020-01-28  245  =09=09=09sdp->sd_lockstruct.l=
s_jid);
601ef0d52e96175 Bob Peterson 2020-01-28  246  =09else
601ef0d52e96175 Bob Peterson 2020-01-28  247  =09=09fs_warn(sdp, "Journal r=
ecovery skipped for %d until next "
601ef0d52e96175 Bob Peterson 2020-01-28  248  =09=09=09"mount.\n", sdp->sd_=
lockstruct.ls_jid);
601ef0d52e96175 Bob Peterson 2020-01-28  249  =09fs_warn(sdp, "Glock dequeu=
es delayed: %lu\n", sdp->sd_glock_dqs_held);
601ef0d52e96175 Bob Peterson 2020-01-28  250  =09sdp->sd_glock_dqs_held =3D=
 0;
601ef0d52e96175 Bob Peterson 2020-01-28  251  =09wake_up_bit(&sdp->sd_flags=
, SDF_WITHDRAW_RECOVERY);
601ef0d52e96175 Bob Peterson 2020-01-28  252  }
601ef0d52e96175 Bob Peterson 2020-01-28  253 =20

:::::: The code at line 126 was first introduced by commit
:::::: 601ef0d52e9617588fcff3df26953592f2eb44ac gfs2: Force withdraw to rep=
lay journals and wait for it to finish

:::::: TO: Bob Peterson <rpeterso@redhat.com>
:::::: CC: Bob Peterson <rpeterso@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--6c2NcOVqGQ03X4Wi
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
TSMkgcCRponR0yIICVR3cv8XKEvqATI6AQA=
--6c2NcOVqGQ03X4Wi--

